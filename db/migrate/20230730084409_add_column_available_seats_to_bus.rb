class AddColumnAvailableSeatsToBus < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :available_seats, :integer
  end
end
