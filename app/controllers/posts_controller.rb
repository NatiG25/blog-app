class PostsController < ApplicationController
  before_action :set_post, only: %i[show]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.recent_comments
  end

  def new
    @post = Post.new
 end

 def create
  @post = Post.new(post_params)
  if @post.save
    redirect_to user_posts_path
  else
    render :new
  end
 end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :text, :comments_counter, :likes_counter)
  end
  private :post_params
end
