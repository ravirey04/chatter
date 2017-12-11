require 'test_helper'

class PingsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pings_home_url
    assert_response :success
  end

end
