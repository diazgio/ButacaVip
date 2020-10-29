class ApplicationController < ActionController::Base
  private
  
  def current_user
    User.where(id: session[:user_id]).first
  end

  def already_attended?
    if session[:user_id].nil?
      false
    else
      current_user.attendances.exists?(event_id: @event.id)
    end
  end
  helper_method :current_user, :already_attended?
end
