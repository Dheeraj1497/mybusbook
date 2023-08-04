module ApplicationHelper

	# before_action :logged_in_user
	def logged_in?
		session[:user_id].present?
	end

	def current_user
		@current_user ||= User.find_by_id(session[:user_id])
	end

	def logged_in_user
		unless logged_in? 
			flash[:notice] = 'Please Login'
			redirect_to root_path
		end
	end
	
end
