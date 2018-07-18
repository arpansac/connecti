require 'test_helper'

class UsersControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get users_controller_profile_url
    assert_response :success
  end

end
