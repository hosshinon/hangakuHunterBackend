class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :postal_code
      t.string :address
      t.string :opening_hours
      t.string :homepage
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
