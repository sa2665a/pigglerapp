class AddDestinationAndSourceIdAndDestinationIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :destination, :string
    add_column :orders, :source_id, :integer
    add_column :orders, :destination_id, :integer
  end
end
