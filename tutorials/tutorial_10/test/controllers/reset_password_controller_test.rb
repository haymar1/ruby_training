require 'test_helper'

class ResetPasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reset_password_index_url
    assert_response :success
  end

  test "should get forgot_password" do
    get reset_password_forgot_password_url
    assert_response :success
  end

end
