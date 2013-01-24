class AddColumnToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :checkout_serial, :string
  end
end
