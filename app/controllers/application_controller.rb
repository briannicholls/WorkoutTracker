class ApplicationController < ActionController::Base

  def logged_in?
    !!(session[:user_id])
  end

  def current_user
    User.find_by id: session[:user_id]
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect_to root_path
    end
  end

  helper_method :redirect_if_not_logged_in
  helper_method :current_user
  helper_method :logged_in?

  private
  
  def set_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
