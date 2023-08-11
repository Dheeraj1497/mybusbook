class AddToIdToBusRoutes < ActiveRecord::Migration[7.0]
  def change
    add_column :bus_routes, :to_id, :integer
  end
end
