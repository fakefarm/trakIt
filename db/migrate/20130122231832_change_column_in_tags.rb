class ChangeColumnInTags < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.integer :tagable_id
      t.string  :tagable_type
    end
  end
end
