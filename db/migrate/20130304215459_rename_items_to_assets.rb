class RenameItemsToAssets < ActiveRecord::Migration
  def change
    rename_table :assets, :assets
  end
end
