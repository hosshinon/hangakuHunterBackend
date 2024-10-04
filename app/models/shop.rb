class Shop < ApplicationRecord
  # find(place_id)で検索できるように主キーを設定
  self.primary_key = :place_id
  has_many :discounts, dependent: :destroy

  validates :name, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :place_id, presence: true
  validates :formatted_address, presence: true
  validates :international_phone_number, presence: true
  validates :website, presence: true
end
