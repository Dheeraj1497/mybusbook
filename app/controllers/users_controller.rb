class UsersController < ApplicationController
 
  skip_before_action :logged_in_user, only:[:new, :create]
  include ApplicationHelper
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = Customer.new(user_params)
    # @user.role = User::roles[:customer]
    if @user.save
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])  
  end

  # private
  # def normalize_name
    
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :password, :mobile_no )
  end

end
