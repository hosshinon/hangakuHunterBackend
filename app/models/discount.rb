class Discount < ApplicationRecord
  validates :place_id, presence: true
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :discount_rate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :description, length: { maximum: 255 }
  validate :end_time_after_start_time

  belongs_to :shop, foreign_key: "place_id", primary_key: "place_id", inverse_of: :discounts

  private

    def end_time_after_start_time
      if end_time.present? && start_time.present? && end_time <= start_time
        errors.add(:end_time, "はスタートタイムより後でなければなりません")
      end
    end
end
