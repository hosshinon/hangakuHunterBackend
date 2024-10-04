FactoryBot.define do
  factory :shop do
    place_id { Faker::Number.number(digits: 10) }
    name { Faker::Company.name }
    rating { Faker::Number.decimal(l_digits: 1, r_digits: 1) }
    user_ratings_total { Faker::Number.number(digits: 3) }
    formatted_address { Faker::Address.full_address }
    international_phone_number { Faker::PhoneNumber.phone_number }
    website { Faker::Internet.url }
  end
end
