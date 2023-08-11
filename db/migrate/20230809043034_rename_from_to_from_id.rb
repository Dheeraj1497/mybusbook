class RenameFromToFromId < ActiveRecord::Migration[7.0]
  def change
    rename_column :bus_routes, :from, :from_id
  end
end
