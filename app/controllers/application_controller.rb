class ApplicationController < ActionController::Base
  def logged_in?
    !!current_user
  end

  def current_user
    User.find session[:user_id]
  end
  helper_method :current_user
end
