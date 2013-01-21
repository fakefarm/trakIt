class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :name
      t.integer :quantity
      t.references :user
      t.references :item
      t.string :status

      t.timestamps
    end
    add_index :checkouts, :user_id
    add_index :checkouts, :item_id
  end
end
