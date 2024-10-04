class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :discount_rate
      t.references :shop, type: :string
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    add_foreign_key :discounts, :shops, column: :shop_id, primary_key: :place_id
  end
end
