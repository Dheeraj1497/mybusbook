class City < ApplicationRecord
	has_many :locations

	has_many :from_routes, class_name: 'BusRoute' , foreign_key: 'from_id'
  has_many :to_routes, class_name: 'BusRoute'  , foreign_key: 'to_id'
end
