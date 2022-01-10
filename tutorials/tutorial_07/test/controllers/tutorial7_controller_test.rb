require 'test_helper'

class Tutorial7ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tutorial7_index_url
    assert_response :success
  end

  test "should get generate" do
    get tutorial7_generate_url
    assert_response :success
  end

end
