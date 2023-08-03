class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @bus = Bus.find_by(id: params[:bus_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find_by_id(params[:id])
  end

  def create
    @bus = Bus.find_by(id:params[:id])
    if @bus.nil?
      flash[:notice] = "Bus Not Available"
    else
      @seats = @bus.available_seats
      # @price = @bus.ticket_price
      if @seats<params[:seats].to_i
        flash[:notice] = "Seats Not Available"
      else
        @booking = Bus.new(book_params)
        # @booking.price(@price*params[:seat_booked].to_i)
        if @booking.save
          @bus.available_seats.update(@seats-params[:seats].to_i)
          redirect_to @booking
        else
          flash[:notice] = "Booking Failed"
        end
      end
    end
  end

  def destroy
    @bookings = Booking.find(params[:id]).destroy
  end

  private
  def book_params
    params.require(:booking).permit(:seat_booked,:status,:user_id,:bus_id,:alphanumeric_id)
  end

end
  