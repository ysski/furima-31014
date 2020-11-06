class Ship < ActiveHash::Base
  self.data = [
    {id: 1,  name: '--'},
    {id: 2,  name: '無料'},
    {id: 3,  name: '送料負担は購入者'},
  ]
  include ActiveHash::Associations
  has_many :items
end
