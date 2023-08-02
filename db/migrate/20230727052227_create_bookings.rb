class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :seat_booked
      t.references :bus_route, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :seat_number

      t.timestamps
    end
  end
end
