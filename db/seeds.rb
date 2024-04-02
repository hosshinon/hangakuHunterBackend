# db/seeds.rb

5.times do |i|
  shop = Shop.create!(
    name: "スーパー#{i + 1}",
    postal_code: "100-000#{i + 1}",
    address: "東京都中央区サンプル町#{i + 1}-#{i + 1}-#{i + 1}",
    opening_hours: "09:00-21:00",
    homepage: "http://example#{i + 1}.com",
    latitude: 35.0 + (i * 0.01),
    longitude: 135.0 + (i * 0.01),
  )

  # 奇数番目の店舗にのみ割引情報を作成
  next unless (i + 1).odd?

  2.times do |j|
    start_date = Time.zone.today + j.days
    end_date = start_date + rand(3..7).days

    Discount.create!(
      shop:,
      title: "割引キャンペーン#{j + 1}",
      description: "店舗#{shop.name}の割引情報#{j + 1}です。",
      start_date:,
      end_date:,
      discount_rate: rand(5..20),
    )
  end
end
