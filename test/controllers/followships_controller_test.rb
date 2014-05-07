require 'test_helper'

class FollowshipsControllerTest < ActionController::TestCase
  test "should get present" do
    get :present
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
