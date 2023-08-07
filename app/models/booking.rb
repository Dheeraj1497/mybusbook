class Booking < ApplicationRecord
  before_save :alphanumeric_id

  belongs_to :bus_route
  belongs_to :customer, foreign_key: :user_id
  belongs_to :bus
  # enum :status, {:confirmed, :pending}, _default: 'pending'
  enum :status, {confirmed: 'confirmed', pending: 'pending'}, default: :pending

  def alphanumeric_id
    # this can create a permalink using a random 8-digit alphanumeric
    self.ticket_no = SecureRandom.urlsafe_base64(8)
  end

end
