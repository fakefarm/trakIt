class ChangeItemIdsToAssetIds < ActiveRecord::Migration
  def change
    rename_column :checkouts,      :item_id, :asset_id
    rename_column :item_features,  :item_id, :asset_id
    rename_column :serial_numbers, :item_id, :asset_id
  end
end
