class AddTicketNoToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :ticket_no, :string
  end
end
