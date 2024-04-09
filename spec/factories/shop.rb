FactoryBot.define do
  factory :shop do
    name { "テストショップ" }
    postal_code { "123-4567" }
    address { "東京都テスト区テスト1-2-3" }
    latitude { 35.6895 }
    longitude { 139.6917 }
  end
end
