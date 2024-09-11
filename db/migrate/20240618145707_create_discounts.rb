class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :place_id
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :discount_rate
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["place_id"], name: "index_discounts_on_shop_id"
    end
  end
end
