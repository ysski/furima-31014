FactoryBot.define do
  factory :user do
    nickname              { 'ysski' }
    email                 { 'kkk@gmail.com' }
    password              { 'a00000' }
    password_confirmation { password }
    hiragana_name_first   { 'ゆうた湯' }
    hiragana_name_last    { 'ささき木' }
    katakana_name_first   { 'ユウタ' }
    katakana_name_last    { 'ササキ' }
    date_of_birth_id      { "1987-02-16" }
  end
end
