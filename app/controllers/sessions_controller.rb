class SessionsController < ApplicationController
  layout "noheader"
  
  def index
    if current_user
      redirect_to works_url
    end
  end

  def callback
    login(request.env["omniauth.auth"])
  end

  def login(auth)
    user = User.find_by_uid_and_provider(auth[:uid], auth[:provider]) || User.create_with_omniauth(auth)
    admin_login(user)
    guest_logout
    redirect_to root_url, :notice => "Signed in."
  end

  def admin_login(user)
    session[:user_id] = user.id
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out."
  end
end
