FactoryBot.define do
  factory :discount do
    shop_id { "1" }
    title { "新春セール" }
    description { "新年のお祝いに全商品10%オフ！" }
    start_time { Time.current.change(hour: 12) }
    end_time { start_time + 3.hours }
    discount_rate { 10 }
  end
end
