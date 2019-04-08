class PlaylistsController < ApplicationController
  def index    #1
    @playlists = Playlist.all
    @one_user = User.find_by(params[current_user])
    @users = User.all
  end

  def new      #2
    @playlist = Playlist.new
    render :form   #6 Crear vista form
  end

  def create    #4
    # playlist = Playlist.new(playlist_parameters)

    # user = User.find_by(params[current_user.email])
    # playlist = Playlist.new(:users => [user])

    @user = User.find_by(params[:current_user])
    playlist = @user.playlists.create(updated_at: Time.now)
    # playlist = Playlist.create(updated_at: Time.now, users: [@user])

    if playlist.save
      redirect_to playlist_path(playlist)
    else
      p "no se guardo"
      redirect_to root_path
    end
  end

  def show     #5
    # @user = User.find(params[:id])
    # @playlist = Playlist.find(params[:id])
    #
    # @playlist = Playlist.all.find(params[:id])
    # @songs = Song.all.find_by(@playlist.songs,@user.songs)
    @playlist = Playlist.find_by(params[:id])
    p "vista show playlist"
    # @user = User.find_by(params[current_user])
  end


  def edit
          @playlist = Playlist.find(params[:id])
          render :form
  end

  def update
        playlist = Playlist.find(params[:id])

        playlist.update(playlist_parameters)
        redirect_to playlist_path(playlist)
  end

  def destroy
        playlist = Playlist.find(params[:id])
        playlist.destroy
        redirect_to root_path
  end

  private    #3

  def playlist_parameters
    params.require(:playlist).permit(:name, :url)

  end
end
