class AuthorizationController < ApplicationController
  before_filter :require_admin

  private
  def require_admin
    unless current_user
      redirect_to auth_url
      return
    end
  end
end
