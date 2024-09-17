class Shop < ApplicationRecord
  # find(place_id)で検索できるように主キーを設定
  self.primary_key = :place_id
  has_many :discounts, dependent: :destroy
end
