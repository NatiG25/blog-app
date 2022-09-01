class PostsController < ApplicationController
  before_action :set_post, only: %i[show]

  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments)
  end

  def show
    @comments = @post.recent_comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_login.id

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(current_login, @post)
    else
      flash.now[:error] = 'Error occured, Post not saved.'
      render :new
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
  private :post_params
end
