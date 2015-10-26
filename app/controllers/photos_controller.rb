class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_filter :select_album, except: [:all_photos, :user_photos, :show, :serve, :destroy, :edit, :update]

  def index
    @album = current_user.albums.find(params[:album_id])
    @photos = @album.photos
  end

  def new
    @photo = @album.photos.new
  end

  def create
    @photo = @album.photos.new(photo_params) do |t|
      if photo_params[:data]
        t.data = photo_params[:data].read
        t.filename = photo_params[:data].original_filename
        t.content_type = photo_params[:data].content_type
      end
      if t.name == ""
        t.name = t.filename
      else
        t.name = t.name + '.' + t.content_type[6,6]
      end
      t.user_id = current_user.id
    end
    if @photo.save
      redirect_to album_photos_path
    else
      redirect_to :back
      flash.now[:notice] = "fill in all filds"
    end
  end

  def show
    @album = Album.find(Photo.find(params[:id]).album_id)
    if @album.user_id == current_user.id
      @photo = @album.photos.find(params[:id])
    else
      redirect_to :error
    end
  end

  def serve
    @photo = Photo.find(params[:id])
    send_data @photo.data, filename: "#{@photo.filename}.jpg", disposition: "inline"
  end

  def edit
    @album = Album.find(Photo.find(params[:id]).album_id)
    if @album.user_id == current_user.id
      @photo = @album.photos.find(params[:id])
    else
      redirect_to :error
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photo_path
    else
      redirect_to 'show'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.delete
      redirect_to :back
    end
  end

  def all_photos
    @photos = Photo.all

  end

  def user_photos
    @user = current_user
    @photos = @user.photos.all
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :user_id, :album_id, :filename, :content_type, :data)
    end

    def select_album
      @album = Album.find(params[:album_id])
    end
end