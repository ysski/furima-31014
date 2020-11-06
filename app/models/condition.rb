class Condition < ActiveHash::Base
  self.data = [
    {id: 1,  name: '--'},
    {id: 2,  name: '優良'},
    {id: 3,  name: '良'},
    {id: 4,  name: '普通'},
  ]
  include ActiveHash::Associations
  has_many :items
end
