class CreateItems < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.integer :quantity
      t.references :bundle
      t.boolean :trackable
      t.timestamps
    end
    add_index :assets, :bundle_id
  end
end
