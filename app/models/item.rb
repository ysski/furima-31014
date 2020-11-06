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



end
