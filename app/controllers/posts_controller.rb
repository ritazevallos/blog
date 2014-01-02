class PostsController < ApplicationController
  before_action :signed_in_user,  only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user,      only: [:new, :create, :edit, :update, :destroy]

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    Post.friendly.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to posts_path
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(user_params)
      flash[:success] = "Post edited"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  private

  def user_params
    params.require(:post).permit(:title, :content)
  end

  # Before filters

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to root_url, notice: "Insufficient priveleges for action."
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
