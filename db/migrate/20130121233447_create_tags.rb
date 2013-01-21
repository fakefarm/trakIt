class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :label
      t.string :input
      t.references :item

      t.timestamps
    end
    add_index :tags, :item_id
  end
end
