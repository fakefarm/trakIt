class CreateAssignmentHistories < ActiveRecord::Migration
  def change
    create_table :assignment_histories do |t|
      t.integer :checkout_id
      t.string :note

      t.timestamps
    end
    add_index :assignment_histories, :checkout_id
  end
end
