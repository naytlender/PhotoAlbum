class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def index
    @albums = @user.albums
  end

  def new
    @album = @user.albums.new
  end

  def create
    @album = @user.albums.new(album_params)
    
    if @album.save
      flash[:notice] = "album created"
      redirect_to @album
    else
      render 'new'
    end
  end

  def show
    @album = @user.albums.find(params[:id])
  end

  def edit
    @album = @user.albums.find(params[:id])
  end

  def update
    @album = @user.albums.find(params[:id])
      if @album.update_attributes(album_params)
        redirect_to @album
      else
        render 'edit'        
      end 
    end
  end

  def destroy
    @album = @user.albums.find(params[:id])
    @album.destroy
    if @album.delete
      redirect_to albums_path
    end
  end

  private
    def album_params
       params.require(:album).permit(:name, :description)
    end

    def check_user
      unless @user = current_user
        redirect_to authenticated_root_path
    end
end