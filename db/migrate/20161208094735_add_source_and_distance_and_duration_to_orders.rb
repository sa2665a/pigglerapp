class AddSourceAndDistanceAndDurationToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :source, :string
    add_column :orders, :distance, :integer
    add_column :orders, :duration, :time
  end
end
