require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new movie' do
    get new_movie_url
    assert_response :success
  end

  test 'should create new movie' do
    post movies_url, params: { movie: { title: 'New Movie' } }
    assert_redirected_to movie_path(Movie.last)
  end

  test 'should get movie' do
    @movie = Movie.new
    @movie.title = 'Some title'
    @movie.save

    get movie_path(Movie.last)
    assert_response :success
  end

  test 'should get all movies' do
    add_movies

    get movies_url
    assert_response :success
  end

  def add_movies
    for i in 0..3
      movie = Movie.new
      movie.title = "Movie #{i}"
      movie.save
    end
  end
end
