class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    binding.pry
    # binding
     # binding.pry
    @bus = Bus.find_by(id: params[:bus_id])
    @booking = Booking.new
  end

  def show
    
    # @booking = Booking.find_by_id(params[:id])
    @booking = Booking.find(params[:id])
  end

  def create
    # binding.pry
    bus = Bus.find_by(id: params[:booking][:bus_id])
    if bus.nil?
      flash[:notice] = "Bus Not Available"
    else 
      seats = bus.available_seats
      if seats < params[:booking][:seat_booked].to_i
        flash[:alert] = "Seats Not Available"
      else
        # booking = booking.find_by_ticket_no(params[:ticket_no])
        booking = Booking.new(book_params)
        booking.bus_route_id = bus.bus_route.id
        booking.user_id = current_user.id
        if booking.save
          bus.update(available_seats: seats - params[:booking][:seat_booked].to_i)
          redirect_to bookings_path #Redirect to Bokkings's Show action
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
    params.require(:booking).permit(:seat_booked,:status,:user_id)
  end 
end
  