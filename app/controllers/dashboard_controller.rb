class DashboardController < ApplicationController
	
	def index
		# binding.pry
		# @bus_routes = BusRoutes.all
		# @from = params[:from]
		# @to = params[:to]
    # @buses = @bus_route.Buses

		bus_routes = BusRoute.all
  	binding.pry
		bus_route = BusRoute.where(bus_params)
		@buses = bus_route.first.buses.where(departure_time: params[:date])
	end

	def show

	end

	def new

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
