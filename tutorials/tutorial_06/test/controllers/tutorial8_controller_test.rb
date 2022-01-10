require 'test_helper'

class Tutorial8ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tutorial8_index_url
    assert_response :success
  end

end
