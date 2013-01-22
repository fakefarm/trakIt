class RemoveColumnFromBundle < ActiveRecord::Migration
  def change
    remove_column :bundles, :input
    remove_column :bundles, :label
    add_column :bundles, :name, :string
  end
end
