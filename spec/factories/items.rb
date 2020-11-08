FactoryBot.define do
  factory :item do
    name                { '桜の写真' }
    description         { '花見の景色' }
    shipping_charge_id  { 2 }
    ship_from_id        { 14 }
    days_to_ship_id     { 2 }
    price               { 1000 }
    genre_id            { 5 }
    condition_id        { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    

  end
end
