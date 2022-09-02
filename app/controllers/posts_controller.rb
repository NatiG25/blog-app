class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: %i[create new destroy]
  before_action :set_post, only: %i[show destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments)
  end

  def show
    @comments = @post.recent_comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = 'Post saved successfully'
      redirect_to user_posts_path(current_user, @post)
    else
      flash[:notice] = 'Error occured, Post not saved.'
      render :new
    end
  end

  def destroy
    @post.destroy

    redirect_to user_posts_path, notice: 'Your post has been deleted'
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
  private :post_params
end
