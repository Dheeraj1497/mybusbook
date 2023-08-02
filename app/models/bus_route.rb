class BusRoute < ApplicationRecord
  has_many :buses, dependent: :destroy
  has_many :bookings
end  
