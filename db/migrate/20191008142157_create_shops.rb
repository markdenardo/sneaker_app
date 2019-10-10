class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.integer :sneaker_id

      t.timestamps
    end
  end
end
