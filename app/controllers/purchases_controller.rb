class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_login

  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end



  private
    def purchase_params
      params.require(:purchase_form).permit(:token, :postcode, :prefecture_id, :city, :street, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
    end

    def move_to_login
      @item = Item.find(params[:item_id])
        if current_user.id == @item.user_id
          redirect_to root_path
        end
    end
end
