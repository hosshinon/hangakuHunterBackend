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
    # 割引情報の開始時間(時：分)と終了時間を設定日本時刻で設定
    start_time = Time.current.change(hour: 9 + j)
    end_time = start_time + 1.hour

    Discount.create!(
      shop:,
      title: "割引キャンペーン#{j + 1}",
      description: "店舗#{shop.name}の割引情報#{j + 1}です。",
      start_time:,
      end_time:,
      discount_rate: rand(5..20),
    )
  end
end
