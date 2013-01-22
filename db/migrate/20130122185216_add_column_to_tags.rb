class AddColumnToTags < ActiveRecord::Migration
  def change
    change_table :tags do |t|
    t.column :bundle, :references
    end
    add_index :tags, :bundle_id
  end
end
