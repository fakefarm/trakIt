class AddDueDateColumnToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :due_date, :date
  end
end
