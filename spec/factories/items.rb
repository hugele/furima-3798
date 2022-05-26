FactoryBot.define do
  factory :item do
    name                {"カメラ"}
    about_item          {"すごく使いやすい"}
    category_id         {1}
    shipping_cost_id    {3}
    prefecture_id       {13}
    delivery_day_id      {3}
    condition_id         {1}
    price                { Faker::Number.within(range: 300..9999999) }
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end