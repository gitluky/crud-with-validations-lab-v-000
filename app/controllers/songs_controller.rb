class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update, :delete]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def update

  end

  def delete
    @song.destroy
    redirect_to :index
  end

  private

  def set_song
    @song = Song.find_by_id(params[:id])
  end

  def song_params
    params[:song].permit(:title, :artist_name, :released, :release_year, :genre)
  end


end
