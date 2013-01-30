class CreateAssetHistories < ActiveRecord::Migration
  def change
    create_table :asset_histories do |t|
      t.string :comments
      t.integer :serial_number_id

      t.timestamps
    end
    add_index :asset_histories, :serial_number_id
  end
end
