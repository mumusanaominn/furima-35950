class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :house, null: false
      t.string :building
      t.string :tel, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
