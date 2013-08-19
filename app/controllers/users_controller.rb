class UsersController < ApplicationController
  include WorksHelper
  
  before_filter :require_guest, :only=>[:show_works, :show]
  
  def show_works
    user = User.find(params[:user_id]) || current_guest
    @years = getWorksEachYears(user)
    @roles = getAllRoles(user)

    p @years[0][0].to_json
    respond_to do |format|
      format.html { render "works/index" }
      format.json {
        render :text => @years.to_json(
          :only => [:id, :name, :year, :role, :personal_work, :url, :description, :image_index],
          :methods => [:image_index]
          )
      }
    end
    
  end

  def show
    @work = Work.find_by_user_id_and_id(params[:user_id] || current_guest.user_id, params[:work_id])
    if @work
      render "works/show"
    else
      redirect_to user_path(current_guest.user_id)
    end
  end

  def guest_authentication
    guest = Guest.find_by_user_id_and_login_id_and_login_password(params[:user_id], params[:guest_id], params[:password])

    if guest
      session[:guest_id] = guest.id
      admin_logout
    end

    redirect_to user_path(params[:user_id])
  end


  private
  def require_guest
    @user_id = params[:user_id]
    if (@user_id == "1")
      session[:guest_id] = @user_id;
    end
    if current_guest == nil
      render 'users/authenticate'
      return
    elsif current_guest.user_id != params[:user_id].to_i
      render 'users/authenticate'
      return
    end
  end
end
