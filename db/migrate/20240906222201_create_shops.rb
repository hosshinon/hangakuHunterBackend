class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :place_id
      t.string :name
      t.decimal :rating
      t.integer :user_ratings_total
      t.string :formatted_address
      t.string :international_phone_number
      t.string :website

      t.timestamps
    end
  end
end
