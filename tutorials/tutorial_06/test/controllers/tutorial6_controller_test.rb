require 'test_helper'

class Tutorial6ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tutorial6_index_url
    assert_response :success
  end

end
