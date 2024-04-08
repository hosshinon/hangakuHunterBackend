class Shop < ApplicationRecord
  has_many :discounts, dependent: :destroy

  # 店舗名、郵便番号、住所、緯度、経度は必須であること
  validates :name, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :address, presence: true
  validates :latitude, numericality: true
  validates :longitude, numericality: true
end
