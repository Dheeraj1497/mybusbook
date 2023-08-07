class UserMailer < ApplicationMailer
	binding.pry
	def welcome_email(user) #This is Params From User Controller
    @user = user
    mail(to: @user.email, subject: 'Welcome to RedBus Official Website')
  end
end
