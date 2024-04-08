class ChangeDateTimeToTimeForDiscounts < ActiveRecord::Migration[7.0]
  def change
    change_column :discounts, :start_date, :time, null: false
    rename_column :discounts, :start_date, :start_time
    change_column :discounts, :end_date, :time, null: false
    rename_column :discounts, :end_date, :end_time
  end
end
