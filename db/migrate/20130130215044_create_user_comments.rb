class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
    add_index :user_comments, :user_id
  end
end
