class Booking < ApplicationRecord
  before_save :alphanumeric_id

  belongs_to :bus_route,   foreign_key: :bus_route_id
  belongs_to :customer, foreign_key: :user_id
  belongs_to :bus, foreign_key: :bus_id      

  belongs_to :drop_point, class_name: 'Location', foreign_key: :drop_point_id
  belongs_to :pickup_point, class_name: 'Location', foreign_key: :pickup_point_id
  
  # enum :status, {:confirmed, :pending}, _default: 'pending'
  enum :status, {confirmed: 'confirmed', pending: 'pending', cancelled: 'cancelled'}, default: :pending

  def alphanumeric_id
    # this can create a permalink using a random 8-digit alphanumeric
    self.ticket_no = SecureRandom.urlsafe_base64(8)
  end

end
