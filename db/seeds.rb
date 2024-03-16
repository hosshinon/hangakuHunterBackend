Shop.create!(name: "スーパーA", address: "東京都新宿区...", postal_code: "160-0022", opening_hours: "09:00-22:00", homepage: "http://example.com", latitude: 35.6895,
             longitude: 139.6917)
5.times do |i|
  Shop.create!(
    name: "スーパー#{i + 1}",
    postal_code: "100-000#{i + 1}",
    address: "東京都中央区サンプル町#{i + 1}-#{i + 1}-#{i + 1}",
    opening_hours: "09:00-21:00",
    homepage: "http://example#{i + 1}.com",
    latitude: 35.0 + (i * 0.01),
    longitude: 135.0 + (i * 0.01),
  )
end
