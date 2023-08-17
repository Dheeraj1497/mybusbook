class BookingsController < ApplicationController

  def index
    # @bookings = Booking.includes(:customer, bus_route: :buses).all
    if current_user.type == 'Admin'
     @bookings = Booking.all
     end
    if current_user.type == 'Customer'
     # @bookings = Booking.where(user_id: current_user.id)
     # @bookings = Booking.includes([:user]).where(user_id: current_user.id)
     @bookings = Booking.includes(:customer, :bus_route, :bus, :drop_point, :pickup_point).where(user_id: current_user.id)
    end
  end

  def new
    binding.pry
    @bus = Bus.find_by(id: params[:bus_id])
    city1 = BusRoute.find_by(from_id: params[:from_id])
    @city1 = city1.from_id
    city2 = BusRoute.find_by(to_id: params[:to_id])
    @city2 = city2.to_id
    @booking = Booking.new
  end

  def show
    
    # @booking = Booking.find_by_id(params[:id])
    @booking = Booking.find(params[:id])
  end

  def create
    binding.pry
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
        @customer_data = Booking.last.customer
        if booking.save
          AdminMailer.new_booking_email(@customer_data).deliver_now
          bus.update(available_seats: seats - params[:booking][:seat_booked].to_i)
          redirect_to (bookings_path) #Redirect to Bokkings's Index action
        else
          flash[:notice] = "Booking Failed"
        end
      end
    end
  end

  def confirm
    binding.pry
    booking = Booking.find(params[:id])
    booking.update(status: 'confirmed')
    redirect_to bookings_path
  end

  def cancel
    binding.pry
    booking = Booking.find(params[:id])
    booking.update(status: 'cancelled')
    redirect_to bookings_path
  end

  def destroy
    @bookings = Booking.find(params[:id]).destroy
  end

  private
  def book_params
    params.require(:booking).permit(:id,:seat_booked,:status,:user_id,:bus_id,:bus_route_id,:pickup_point_id,:drop_point_id,:date)
  end 
end
  