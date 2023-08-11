class AddFromIdToBusRoutes < ActiveRecord::Migration[7.0]
  def change
    add_column :bus_routes, :from_id, :integer
  end
end
