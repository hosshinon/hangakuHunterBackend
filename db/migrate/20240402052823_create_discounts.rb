class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :discount
      t.integer :discount_rate
      t.timestamps
    end
  end
end
