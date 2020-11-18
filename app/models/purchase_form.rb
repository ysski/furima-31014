class PurchaseForm
  
  include ActiveModel::Model
  attr_accessor :token, :postcode, :prefecture_id, :city, :street, :building_name, :phone_number, :item_id, :user_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0, message: "must be other than 0" }
    validates :city
    validates :street
    validates :token
  end


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, street: street, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end