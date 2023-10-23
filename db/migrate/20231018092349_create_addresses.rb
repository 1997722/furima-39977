class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post_code, null:false
      t.string :tel_number, null:false
      t.integer :prefecture_id, null:false
      t.string :ship_address, null:false
      t.string :street_address, null:false
      t.string :building
      t.references :buy, null:false, foreign_key: true
      t.timestamps
    end
  end
end
