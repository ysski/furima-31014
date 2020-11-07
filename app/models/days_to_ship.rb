class DaysToShip < ActiveHash::Base
  self.data = [
    {id: 1,  name: '--'},
    {id: 2,  name: '配送まで1-2日'},
    {id: 3,  name: '配送まで2-3日'},
    {id: 4,  name: '配送まで4-7日'},
  ]

  include ActiveHash::Associations
  has_many :itemss
end
