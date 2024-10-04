FactoryBot.define do
  factory :discount do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    start_time { Time.current - 1.day }
    end_time { Time.current + 1.day }
    discount_rate { rand(1..50) }
    shop
  end
end
