class Item < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :category, presence: true
  validates :shipping_charges, presence: true
  validates :ship_from, presence: true
  validates :days_to_ship, presence: true
  validates :price, presence: true


  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '' } do
    validates :price
  end
end
