class ItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :shipping_charge_id, :ship_from_id, :days_to_ship_id, :price, :genre_id, :condition_id).merge(user_id: current_user.id)
  end
  end
end

