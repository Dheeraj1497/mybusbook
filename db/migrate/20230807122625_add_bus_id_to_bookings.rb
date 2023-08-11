class AddBusIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :bus_id, :integer
  end
end
