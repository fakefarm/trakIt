class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :label
      t.string :input

      t.timestamps
    end
  end
end
