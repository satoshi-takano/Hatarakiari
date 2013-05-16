class GuestsController < AuthorizationController
  
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
          p @guest.errors
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
