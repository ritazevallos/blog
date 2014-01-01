class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
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

  private

  def user_params
    params.require(:post).permit(:title, :content)
  end

end
