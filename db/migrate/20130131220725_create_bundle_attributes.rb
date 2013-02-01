class CreateBundleAttributes < ActiveRecord::Migration
  def change
    create_table :bundle_attributes do |t|
      t.string :bundle_key
      t.string :bundle_value
      t.integer :bundle_id

      t.timestamps
    end
    add_index :bundle_attributes, :bundle_id
  end
end
