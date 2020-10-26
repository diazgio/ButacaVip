class ApplicationController < ActionController::Base
  private

  def current_user
    User.where(id: session[:user_id]).first
  end
  helper_method :current_user
end
