class AddDiscountRateToDiscounts < ActiveRecord::Migration[7.0]
  def change
    add_column :discounts, :discount_rate, :integer
  end
end
