class SessionsController < ApplicationController

  def index
    if current_user
      redirect_to works_url
    end
  end

  def callback
    create
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_uid_and_provider(auth[:uid], auth[:provider]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    guest_logout
    redirect_to root_url, :notice => "Signed in."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out."
  end
end
