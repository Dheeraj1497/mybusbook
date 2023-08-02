class SessionsController < ApplicationController

  def new

  end

	def create
		# binding.pry
		@user = User.find_by(email: params[:email])
    # binding.pry
		#authenticate user Credentials
    if @user && @user.authenticate(params[:password])
    	#set session and redirect on success
    	session[:user_id] = @user.id
      
    	redirect_to new_dashboard_path, notice: 'Logged in!'
    else
    	#error message on fail
    	message = "Somthing went wrong!!!!  make sure your username and passsword are correct"
    	redirect_to root_path, notice: message
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have been signed out!"
  end
    
end