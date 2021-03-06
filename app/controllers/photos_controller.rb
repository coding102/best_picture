class PhotosController < ApplicationController
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    before_action :current_user, only: :destroy
    
    def vote
        puts "VOTING WITH #{params}"
        @photo = Photo.find(params[:id])
        @photo.vote+=1
        @photo.voting_users.push current_user
        @photo.save
#        redirect_to photos_path
    end
  # GET /photos
  # GET /photos.json
  def index
    @photos =Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @user = User.find_by(params[:user_id])
    @photo = Photo.find(photo_params)
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
      @photo = Photo.new(photo_params)
      @photo.vote =0
    respond_to do |format|
      if @photo.save
          current_user.photos.push @photo
          format.html { redirect_to photos_path, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }

      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
      # @photo is pulling Photo's information 
      @photo = Photo.find(params[:id])
      # @photo_id is keeping the photos id
      @photo_id = @photo.id
      # Is destroying the photo
      @photo.destroy
      # @photo = current_user.photos.find_by(id: params[:id])
      # redirect_to root_url if @photo.nil?
      # redirect_to photos_path
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
#      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:user_id, :avatar, :body, :vote)
    end
end