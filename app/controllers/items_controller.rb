class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :introduction, :category_id, :item_condition_id, :price, :delivery_fee_id, :delivery_area_id, :delivery_days_id).merge(user_id: current_user.id)
  end
end
