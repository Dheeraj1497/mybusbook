class Bus < ApplicationRecord
  belongs_to :bus_route
  has_many :bookings
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true
  # validates :departure_time, presence: true
  # validates :arrival_time, presence: true
end
