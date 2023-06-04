require "test_helper"

class Admin::PostMealsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_meals_index_url
    assert_response :success
  end
end
