class Shop < ApplicationRecord
  has_many :discounts, dependent: :destroy
end
