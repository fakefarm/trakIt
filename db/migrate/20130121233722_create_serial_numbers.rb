class CreateSerialNumbers < ActiveRecord::Migration
  def change
    create_table :serial_numbers do |t|
      t.string :number
      t.boolean :trackable
      t.date :warranty_end
      t.references :item
      t.references :user

      t.timestamps
    end
    add_index :serial_numbers, :item_id
    add_index :serial_numbers, :user_id
  end
end
