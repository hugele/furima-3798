FactoryBot.define do
  factory :credit_card_address do
    post_number { '123-4567' }
    prefecture_id { "2" }
    city { "1" }
    address { '1-1' }
    building { '東京団地'}
    phone { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
    association :item
    association :user
  end
end