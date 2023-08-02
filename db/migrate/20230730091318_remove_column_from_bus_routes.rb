class RemoveColumnFromBusRoutes < ActiveRecord::Migration[7.0]
  def change
    remove_column :bus_routes, :departure_time, :datetime
    remove_column :bus_routes, :arrival_time, :datetime
  end
end
