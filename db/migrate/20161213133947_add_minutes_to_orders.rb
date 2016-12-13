class AddMinutesToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :minutes, :integer
  end
end
