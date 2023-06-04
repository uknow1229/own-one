require "test_helper"

class Public::PostMealsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_meals_index_url
    assert_response :success
  end

  test "should get show" do
    get public_post_meals_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_meals_edit_url
    assert_response :success
  end
end
