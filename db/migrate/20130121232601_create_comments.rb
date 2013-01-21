class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :notes
      t.references :checkout

      t.timestamps
    end
    add_index :comments, :checkout_id
  end
end
