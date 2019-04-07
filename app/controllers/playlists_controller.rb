class PlaylistsController < ApplicationController
  def index    #1
    @playlists = Playlist.all
  end

  def new      #2
    @playlist = Playlist.new
    render :form   #6 Crear vista form
  end

  def show     #5
    # @user = User.find(params[:id])
    # @playlist = Playlist.find(params[:id])
    #
    # @playlist = Playlist.all.find_by(@playlist.songs,@user.songs)
    # @songs = Song.all.find_by(@playlist.songs,@user.songs)

    @playlist = Playlist.find(params[:id])
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
