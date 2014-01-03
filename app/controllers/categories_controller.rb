class CategoriesController < ApplicationController

  before_action :signed_in_user,  only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user,      only: [:new, :create, :edit, :update, :destroy]

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.paginate(page: params[:page])
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  # Before filters

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to root_url, notice: "Insufficient privileges for action."
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end