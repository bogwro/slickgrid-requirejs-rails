require 'test_helper'

class ExamplesControllerTest < ActionController::TestCase
  test "should get simple" do
    get :simple
    assert_response :success
  end

end
