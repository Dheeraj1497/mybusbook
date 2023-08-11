class RemoveFromIdFromBusRoutes < ActiveRecord::Migration[7.0]
  def change
    remove_column :bus_routes, :from_id, :string
  end
end
