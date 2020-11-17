FactoryBot.define do
  factory :purchase_form do
    postcode               {'123-4567'}
    prefecture_id              {'1'}
    city                   {'横浜市緑区'}
    street                 {'青山1-1-1'}
    building_name          {'柳ビル103'}
    phone_number           {'09012345678'}
  end
end
