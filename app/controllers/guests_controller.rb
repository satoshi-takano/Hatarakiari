class GuestsController < ApplicationController
  before_filter :require_admin

  include SessionsHelper
  
  def index
    if current_user
      @guests = current_user.guests
    else
      @guests = []
    end
  end

  def new
    @guest = current_user.guests.build
  end

  def create
    @guest = Guest.new(params[:guest])
    respond_to do |format|
      if @guest.save
        format.html { redirect_to guests_path, notice: 'Guest was successfully created.'; return }
        format.json { render json:@guest, status: :created, location: @guest }
      else
        format.html {
          render 'new'
        }
        format.json { render json:@guest.error, status:unprocessable_entity }
      end
    end
  end

  def update
    guest = Guest.find(params[:id])
    guest.update_attributes(:memo=>params[:memo])
    render :text=>guest.memo
  end

  def edit
  end

  def show
  end

  def destroy
    guest = Guest.find(params[:id])
    guest.destroy

    redirect_to guests_path
  end

end
