class ItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @Item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category, :condition, :shipping_charges, :ship_from, :days_to_ship, :price, :title,:text,:genre_id, :ship_id, :area_id, :day_id, :condition_id)
  end
end

