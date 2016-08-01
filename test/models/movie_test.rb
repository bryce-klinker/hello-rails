require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test 'should not save movie without title' do
    movie = Movie.new
    assert_not movie.save
  end

end
