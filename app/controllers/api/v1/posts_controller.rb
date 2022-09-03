class API::V1::PostsController < ApplicationController
before_action :set_post, only: %i[show]

def index
    @user = User.find(params[:user_id])
    @posts = Post.all
end

def set_post
    @post = Post.find(params[:id])
end

private :set_post
end
