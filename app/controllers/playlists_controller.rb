class PlaylistsController < ApplicationController
  def index    #1
    @playlists = Playlist.all
    @one_user = User.find_by(params[current_user])
    @users = User.all
  end

  def new      #2
    @playlist = Playlist.new
    @song = Song.new
    render :form   #6 Crear vista form
  end

  def show     #5
    # @user = User.find(params[:id])
    # @playlist = Playlist.find(params[:id])
    #
    # @playlist = Playlist.all.find_by(@playlist.songs,@user.songs)
    # @songs = Song.all.find_by(@playlist.songs,@user.songs)

    @playlist = Playlist.find(params[:id])
    @user = User.find_by(params[current_user])
  end

  def create    #4
    playlist = Playlist.new(playlist_parameters)

    if playlist.save
      redirect_to playlist_path(playlist)
    false
      render root_path
    end
  end


  private    #3

  def playlist_parameters
    params.require(:playlist).permit(:name, :url)
  end
end
