class Booking < ApplicationRecord
  before_save :alphanumeric_id

  belongs_to :bus
  belongs_to :customer

  # enum :status, {:confirmed, :pending}, _default: 'pending'
  enum :status, [:confirmed, :pending], default: :pending

  def alphanumeric_id

  end

end
