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
end
