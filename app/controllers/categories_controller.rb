class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.where(author: current_user).order(created_at: :desc)
  end

  def show
    @category = Category.find_by(id: params[:id])
    @items = @category.items.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    author = current_user
    category.author = author

    if category.save
      flash[:notice] = 'Category created successfully'
    else
      flash[:alert] = 'Category creation failed'
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
