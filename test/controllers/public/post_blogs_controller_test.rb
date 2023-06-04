require "test_helper"

class Public::PostBlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_blogs_index_url
    assert_response :success
  end

  test "should get show" do
    get public_post_blogs_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_blogs_edit_url
    assert_response :success
  end
end
