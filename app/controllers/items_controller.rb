class ItemsController < ApplicationController
  def new
    @category = Category.includes(:author).find_by(id: params[:category_id])
    @item = Item.new
  end

  def create
    author = current_user
    @category = Category.includes(:author).find_by(id: params[:category_id])
    @item = Item.new(item_params)
    @item.author = author

    if @item.save
      @item.categories << @category
      flash[:notice] = 'Item created successfully'
    else
      flash[:alert] = 'Item creation failed'
    end
    redirect_to category_path(@category)
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount)
  end
end
