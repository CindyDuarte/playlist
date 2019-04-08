class UsersController < ApplicationController
  def index
    @users = User.all
    @one_playlist = Playlist.find_by(params[:id])
  end

  def show
    @user = User.find_by(params[current_user])
    puts "vista show"
  end

end
