class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.create
    @like.user_id = current_login.id
    @like.post = @post
    if @like.save
      flash[:success] = 'Like Added successfully'
      redirect_to user_post_path(current_login, @post)
    else
      flash.now[:error] = 'Error: Like could not be saved'
    end
  end
end
