class AddAmountToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :amount, :integer
  end
end
