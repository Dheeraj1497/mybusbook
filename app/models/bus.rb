class Bus < ApplicationRecord
    belongs_to :bus_route
    validates :name, presence: true, uniqueness: true
    validates :number, presence: true
    # validates :departure_time, presence: true
    # validates :arrival_time, presence: true
end
