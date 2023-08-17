class BusRoutesController < ApplicationController
  # before_action :get_bus
  before_action :set_bus_routes, only: [:show, :edit, :update, :destroy]
  
  def index
    @bus_routes = BusRoute.all
  end

  def show

  end
 
  def new
    @bus_route = BusRoute.new
  end

  def edit
  end

  def create
    @bus_route = BusRoute.new(post_params)

      if @bus_route.save  
          # flash[:notice] = "Bus Details '#{@bus.name}' has been created successfully."
        # redirect_to bus_bus_routes(@bus)
        redirect_to new_bus_route_path, notice: 'Bus route was successfully created.'
      else
          render :new, status: :unprocessable_entity
      end
  end

  def update
      if @bus_routes.update(post_params)
        # redirect_to bus_bus_routes(@bus)
        redirect_to bus_routes_path, notice: 'Bus route was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @bus_routes.destroy
    # redirect_to bus_bus_routes_path(@bus)
    redirect_to bus_routes_url, notice: 'Bus route was successfully destroyed.'
  end

  private

  # Filter
  def set_bus_routes
    @bus_routes = BusRoute.find(params[:id])
  end

  def post_params
    params.require(:bus_route).permit(:from_id, :to_id)
  end
  
end
