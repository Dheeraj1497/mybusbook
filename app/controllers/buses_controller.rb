class BusesController < ApplicationController
  # Filter For the actions
  before_action :set_bus_detail, only: [:show, :edit, :update, :destroy]
  #Getting routes data into bus 
  before_action :get_routes

  def index
    @buses = @bus_route.Buses
  end

  def new
    @bus = @bus_route.buses.build
  end

  def create
    # binding.pry
    @bus = @bus_route.buses.new(bus_params)
    if @bus.save
      flash[:notice] = "Bus Details '#{@bus.name}' has been created successfully."
      redirect_to buses_path(@bus)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @bus.update(bus_params)
    redirect_to bus_path(@bus)
  end

  def destroy
    @bus.destroy

    redirect_to buses_path
  end

  private

  def bus_params
    params.require(:bus).permit(:name, :number, :total_seats,:available_seats,:departure_time,:arrival_time)
  end

  def get_routes
    @bus = BusRoutes.find(params[:bus_route_id])
  end

  def set_bus_detail
    @bus = @bus_route.bus.find(params[:id])
  end

end
