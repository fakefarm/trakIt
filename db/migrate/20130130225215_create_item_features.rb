class CreateItemFeatures < ActiveRecord::Migration
  def change
    create_table :item_features do |t|
      t.string :feature_key
      t.string :feature_value
      t.integer :item_id

      t.timestamps
    end
    add_index :item_features, :item_id
  end
end
