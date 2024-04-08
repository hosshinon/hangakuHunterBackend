class Discount < ApplicationRecord
  belongs_to :shop

  # 割引率は0以上100以下の整数であること
  validates :discount_rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  # タイトルは必須であること
  validates :title, presence: true

  # 説明は必須でないが、存在する場合は最大文字数を設定することもできる
  validates :description, length: { maximum: 255 }, allow_blank: true

  # 開始時間は必須で、終了時間よりも前であること
  validates :start_time, presence: true
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
end
