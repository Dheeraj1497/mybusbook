class RenameToToToId < ActiveRecord::Migration[7.0]
  def change
    rename_column :bus_routes, :to, :to_id
  end
end
