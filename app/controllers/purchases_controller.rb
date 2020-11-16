class PurchasesController < ApplicationController
  def index
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purcase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end



  private
    def purcase_params
      params.require(:purchase_form).permit(:token, :postcode, :prefecture_id, :city, :street, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
    end
end
