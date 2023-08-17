class AdminMailer < ApplicationMailer
    binding.pry
	def new_booking_email(customer_data)
    @customer_data = customer_data
    mail(to: "dheeraj.rathod48@gmail.com", subject: "You got a new Booking!")
  end
end
