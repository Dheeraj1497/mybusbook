class DashboardController < ApplicationController
	before_action :logged_in_user
  include ApplicationHelper 

	def index
		binding.pry
		bus_route = BusRoute.where(bus_params)
		# @buses = bus_route.first.buses.where(departure_time: params[:date])
		# date = BusRoute.where(date: params[:date])
		if params[:date] < (Date.today).to_s
			redirect_to new_dashboard_path
			flash[:alert] = "Past Dates Not allowed."
		end
		if params[:date] >= (Date.today).to_s
			@buses = bus_route.first.buses.where(departure_time: params[:date])
		end
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
    params.permit(:from_id, :to_id)
  end

end
