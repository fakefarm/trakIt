class AddColumnToTags < ActiveRecord::Migration
  def change
    add_column :tags, :bundle_id, :integer
  end
end
