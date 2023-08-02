class BusRoutesController < ApplicationController
  # before_action :get_bus
  before_action :set_bus_routes, only: [:show, :edit, :update, :destroy]
  
  # GET /posts
  def index
    @bus_routes = BusRoutes.all
  end

  # GET /posts/1
  def show

  end

  # GET /posts/new
  def new
    @bus_routes = BusRoutes.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @bus_routes = BusRoutes.new(post_params)

      if @bus_routes.save  
          # flash[:notice] = "Bus Details '#{@bus.name}' has been created successfully."
        # redirect_to bus_bus_routes(@bus)
        redirect_to @bus_route, notice: 'Bus route was successfully created.'
      else
          render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /posts/1
  def update
      if @bus_routes.update(post_params)
        # redirect_to bus_bus_routes(@bus)
        redirect_to @bus_route, notice: 'Bus route was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @bus_routes.destroy
    # redirect_to bus_bus_routes_path(@bus)
    redirect_to bus_routes_url, notice: 'Bus route was successfully destroyed.'
  end

  private

  def set_bus_routes
    @bus_routes = BusRoutes.find(params[:id])
  end

    # def get_bus
    #  @bus = Bus.find(params[:bus_id])
    # end
    # Use callbacks to share common setup or constraints between actions.
    # def set_bus_routes
    #   @bus_routes = @Busroutes.find(params[:id])
    # end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:bus_routes).permit(:from, :to)
    end
end
