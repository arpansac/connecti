require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get toggle" do
    get likes_toggle_url
    assert_response :success
  end

end
