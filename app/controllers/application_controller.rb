class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :current_guest

  def logout
    admin_logout
    guest_logout
    redirect_to root_url    
  end

  def admin_logout
    session[:user_id] = nil
  end

  def guest_logout
    session[:guest_id] = nil
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
    session[:user_id] = nil
  end

  def current_guest
    @current_guest ||= Guest.find(session[:guest_id]) if session[:guest_id]
    rescue
    session[:guest_id] = nil
  end

end
