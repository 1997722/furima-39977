class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :product, null: false, default: ""
      t.integer :price, null: false, default: 0
      t.integer :category_id, null: false, default: 0
      t.text :content, null: false         
      t.integer :state_id, null: false, default: 0
      t.integer :postage_id, null: false, default: 0
      t.integer :prefecture_id, null: false, default: 0
      t.integer :shipping_date_id, null: false, default: 0
      t.references :user, null: false, foreign_key: true 
      t.timestamps
    end
  end
end