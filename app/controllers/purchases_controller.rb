class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_items
  before_action :move_to_login
  
  def index 
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)

    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end



  private
    def purchase_params
      params.require(:purchase_form).permit(:postcode, :prefecture_id, :city, :street, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
    end

    def set_items
      @item = Item.find(params[:item_id])
    end

    def move_to_login
      if current_user.id == @item.user_id || @item.purchase != nil
        redirect_to root_path
      end
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

end 
