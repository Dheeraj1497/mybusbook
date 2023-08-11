class BusRoute < ApplicationRecord
  has_many :buses, :dependent => :destroy
  has_many :bookings

  belongs_to :from_city, class_name: 'City', foreign_key: :from_id
  belongs_to :to_city, class_name: 'City', foreign_key: :to_id

  # belongs_to :cities, foreign_key: :from_id
  # belongs_to :cities, foreign_key: :to_id
end  
