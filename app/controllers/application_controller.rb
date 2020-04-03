class ApplicationController < ActionController::Base
  

  def logged_in?
    !!current_user
  end

  def current_user
    User.find session[:user_id]
  end

  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end

  helper_method :redirect_if_not_logged_in
  helper_method :current_user
end
