require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new movie' do
    get new_movie_url
    assert_response :success
    assert_select 'form'
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
    assert_select 'a.edit-movie'
  end

  test 'should start editing movie' do
    @movie = Movie.first

    get edit_movie_path(@movie)
    assert_response :success
    assert_select 'form'
  end

  test 'should get all movies' do
    add_movies

    get movies_url
    assert_response :success
    assert_select 'ul.movies' do
      assert_select 'li.movie'
    end

    assert_select 'a.new-movie'
  end

  test 'should save updated movie' do
    movie = Movie.first
    patch movie_url(movie), params: { movie: { title: 'not the same' } }

    assert_redirected_to movie_path(movie)

    movie.reload
    assert_equal 'not the same', movie.title
  end

  def add_movies
    for i in 0..3
      movie = Movie.new
      movie.title = "Movie #{i}"
      movie.save
    end
  end
end
