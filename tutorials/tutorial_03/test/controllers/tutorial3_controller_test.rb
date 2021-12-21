require 'test_helper'

class Tutorial3ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tutorial3_index_url
    assert_response :success
  end

end
