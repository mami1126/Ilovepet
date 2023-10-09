class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      redirect_to admin_genres_path
    end
  end

  # def edit
  #   @genre = Genre.find(params[:id])
  # end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to "/admin/genres"
  end

private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
