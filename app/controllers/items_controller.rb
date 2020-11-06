class ItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category, :condition, :shipping_charges, :ship_from, :days_to_ship, :price)
  end
end
