class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  def index
    @posts = Post.all
    @user = current_user
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      flash.now[:alert] = "Can't post empty post"
      render :new, status: :unprocessable_entity
    end
  end
private
  def post_params
    params.expect(post: [:content])
  end
  def require_login
    unless user_signed_in?
      flash[:error] = "Login required"
      redirect_to new_user_session_path
    end
  end
end
