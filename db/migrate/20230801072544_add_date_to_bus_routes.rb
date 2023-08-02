class AddDateToBusRoutes < ActiveRecord::Migration[7.0]
  def change
    add_column :bus_routes, :date, :date
  end
end
