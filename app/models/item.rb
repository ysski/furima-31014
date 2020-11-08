class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :condition_id, presence: true
  validates :genre_id, presence: true, numericality: { other_than: 1 } 
  validates :shipping_charge_id, presence: true
  validates :ship_from_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, numericality: { :greater_than => 300 }
  validates :price, numericality: { :less_than => 9999999 }


  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'Price is not a number'} do
    validates :price
  end
  has_one_attached :image
  belongs_to :genre
  belongs_to :condition
  belongs_to :ship_from
  belongs_to :shipping_charge
  belongs_to :days_to_ship
end
