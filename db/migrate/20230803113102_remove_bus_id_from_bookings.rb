class RemoveBusIdFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :bus_id, :integer
  end
end
