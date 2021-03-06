class PhotosController < ApplicationController

  before_filter :checklogin
  
  # GET /photos
  # GET /photos.json
  def index
    if session[:user_id] != nil 
         redirect_to '/home'
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    # @comments = Comment.where(:photo_id => params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = session[:user_id]

    respond_to do |format|
      if @photo.save
        format.html { redirect_to '/home', notice: 'You have uploaded a new photo'}
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])
    respond_to do |format|
      if @photo.update_attributes(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to '/home', notice: 'You have deleted the picture' }
      format.json { head :no_content }
    end
  end

  private

    def photo_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:photo).permit(:image, :description)
    end
end
