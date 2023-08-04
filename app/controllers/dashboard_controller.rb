class DashboardController < ApplicationController
	binding.pry
	before_action :logged_in_user
  include ApplicationHelper 

	def index
  	
		bus_route = BusRoute.where(bus_params)
		@buses = bus_route.first.buses.where(departure_time: params[:date])
	end

	def show

	end

	def new
    # binding.pry
	end

	def create

	end

	# private
	# def bus_params
	# 	params.require(:bus_routes)
	# end
	private
  def bus_params
    params.permit(:from, :to)
  end

end
