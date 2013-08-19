class WorksController < ApplicationController
  before_filter :require_admin, :except => [:show]

  include WorksHelper
  include SessionsHelper
  
  # GET /works
  # GET /works.json
  def index
    @years = getWorksEachYears(current_user)
    @roles = getAllRoles(current_user)

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

  # GET /works/1
  # GET /works/1.json
  def show
    if current_user
      @work = Work.find_by_user_id_and_id(current_user.id, params[:id])
    end

    if current_guest && @work == nil
      @work = Work.find_by_user_id_and_id(current_guest.user_id, params[:id])
      if @work == nil
        @work = Work.find_by_user_id_and_id(1, params[:id])
      end
    end
    
    if @work == nil
      @user_id = Work.find(params[:id]).user_id
      render "users/authenticate"
    end
  end

  # GET /works/new
  # GET /works/new.json
  def new
    @work = current_user.works.build
    @guest = current_user.guests.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work }
    end
  end

  # GET /works/1/edit
  def edit
    @work = Work.find(params[:id])
  end

  # POST /works
  # POST /works.json
  def create
    @work = current_user.works.build(params[:work])
    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
        format.json { render json: @work, status: :created, location: @work }
      else
        format.html { render action: "new" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.json
  def update
    @work = Work.find(params[:id])
    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    work = current_user.works.find(params[:id])
    work.destroy

    respond_to do |format|
      format.html { redirect_to works_url }
      format.json { head :no_content }
    end
  end

end
