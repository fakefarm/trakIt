class UpdateColumnDateInCheckout < ActiveRecord::Migration
  def change
    change_column :checkouts, :due_date, :datetime
  end
end
