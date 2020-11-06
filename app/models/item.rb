class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :category, presence: true
  validates :shipping_charges, presence: true
  validates :ship_from, presence: true
  validates :days_to_ship, presence: true
  validates :price, presence: true
  validates :price, :numericality => { :greater_than => 300 }
  validates :price, :numericality => { :less_than => 9999999 }
  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '' } do
    validates :price
  end

  belongs_to :genre
  belongs_to :condition
  belongs_to :ship
  belongs_to :area
  belongs_to :day
end
