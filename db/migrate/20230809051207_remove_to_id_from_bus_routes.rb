class RemoveToIdFromBusRoutes < ActiveRecord::Migration[7.0]
  def change
    remove_column :bus_routes, :to_id, :string
  end
end
