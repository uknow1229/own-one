require "test_helper"

class Admin::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_end_users_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_end_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_end_users_edit_url
    assert_response :success
  end
end
