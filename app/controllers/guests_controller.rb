class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def new
    
  end

  def create
    @guest = Guest.new(params[:guest])
    respond_to do |format|
      if @guest.save
        format.html { redirect_to work_path(@guest.work_id), notice: 'Guest was successfully created.'; return }
        format.json { render json:@guest, status: :created, location: @guest }
      else
        format.html {
          @work = Work.find(@guest.work_id)
          render 'works/show'
        }
        format.json { render json:@guest.error, status:unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
  end

  def destroy
  end

end
