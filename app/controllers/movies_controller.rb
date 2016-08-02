class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new

  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to @movie
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
    def movie_params
      params.require(:movie).permit(:title)
    end
end
