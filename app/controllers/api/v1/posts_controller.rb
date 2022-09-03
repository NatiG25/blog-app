class API::V1::PostsController < ApplicationController
before_action :set_post

def show
    @user = User.find(params[:user_id])
end

def set_post
    @post = Post.find(params[:id])
end

private :set_post
end
