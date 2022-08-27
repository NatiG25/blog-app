class CommentsController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to user_post_path(current_user, @post)
    else
      flash.now[:error] = 'Error: Comment could not be created'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
