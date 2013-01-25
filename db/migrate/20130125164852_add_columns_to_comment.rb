class AddColumnsToComment < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
