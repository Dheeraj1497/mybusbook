class AddPickupPointIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :pickup_point_id, :integer
  end
end
