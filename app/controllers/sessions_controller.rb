class SessionsController < ApplicationController
  def create
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'User was successfully Loged In'
    else
      flash[:alert] = 'Invalid Login'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logout'
  end
end
