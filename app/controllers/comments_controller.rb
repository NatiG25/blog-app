class CommentsController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    @comments = Comment.all
  end

  def show; end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
