class Shop < ApplicationRecord
  has_many :discounts, dependent: :destroy

  validates :name, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :address, presence: true
  validates :latitude, numericality: true
  validates :longitude, numericality: true
end
