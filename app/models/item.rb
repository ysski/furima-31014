class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Price is not a number'}
    validates :name
    validates :image
    validates :description
    validates :condition_id, numericality: { other_than: 1 } 
    validates :shipping_charge_id, numericality: { other_than: 1 } 
    validates :days_to_ship_id, numericality: { other_than: 1 } 
    validates :genre_id, numericality: { other_than: 1 } 
    validates :ship_from_id, numericality: { other_than: 0 }
    validates :price, numericality: { greater_than: 299 }
    validates :price, numericality: { less_than: 10000000 }
  end
    has_one_attached :image
    has_one :purchase
    belongs_to :genre
    belongs_to :condition
    belongs_to :ship_from
    belongs_to :shipping_charge
    belongs_to :days_to_ship
    belongs_to :user
end
