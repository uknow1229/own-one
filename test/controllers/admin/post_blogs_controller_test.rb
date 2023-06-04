require "test_helper"

class Admin::PostBlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_blogs_index_url
    assert_response :success
  end
end
