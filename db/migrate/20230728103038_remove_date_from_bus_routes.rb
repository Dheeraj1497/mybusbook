class RemoveDateFromBusRoutes < ActiveRecord::Migration[7.0]
  def change
    remove_column :bus_routes, :date, :datetime
  end
end
