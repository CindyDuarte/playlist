class SongsController < ApplicationController

  def index
    @songs = Song.all
    @one_user = User.find_by(params[current_user])
    @users = User.all
  end

  def new      #2
    @song = Song.new
    render :form   #6 Crear vista form

  end

  def create    #4
    # song = Song.new(song_parameters)

    # user = User.find_by(params[current_user.email])
    # playlist = Playlist.find_by(params[:id])
    # song = Song.new(:playlists => [playlist],:users => [user],:song => [song_parameters])

    @playlist = Playlist.find_by(params[:id])
    song = @playlist.songs.create(updated_at: Time.now)

    p "Estoy en create"
    if song.save
      redirect_to song_path(song)
    else
      p "No se guardo"
      redirect_to root_path
    end
  end

  def show
    @song = Song.find(params[:id])
    puts "vista show"
  end

  def edit
          @song = Song.find(params[:id])
          render :form
  end

  def update
        song = Song.find(params[:id])

        song.update(song_parameters)
        redirect_to song_path(song)
  end

  def destroy
        song = Song.find(params[:id])
        song.destroy
        redirect_to songs_path
  end

private    #3

  def song_parameters
    params.require(:song).permit(:name, :url, :artist, :genre)
  end
end
