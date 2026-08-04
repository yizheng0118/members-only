class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = current_user
  end
end
