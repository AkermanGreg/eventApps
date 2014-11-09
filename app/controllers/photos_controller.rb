class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
    @photo =Photo.new
  end

  def show
	@photo = Photo.find(params[:id])
  end

  def create

    # Find our parent decision that we should attach to
    @photo = current_user.photos.new(photo_params)
    @photo.date ||= DateTime.now
    # Attach this criterion to a decision
    if @photo.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @phto= Photo.find(params[:id])
    if @photo.update_attributes(params.require(:photo).permit(:image))
      redirect_to photos_path
    else
      render 'edit'
    end
  end
 

  def photo_params
    params.require(:photo).permit(:image)
  end
end