class RemoveColumnFromTags < ActiveRecord::Migration
  def change
     remove_column :tags, :item_id
     remove_column :tags, :bundle_id
  end
end
