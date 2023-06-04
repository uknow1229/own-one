require "test_helper"

class Public::PostWorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_workouts_index_url
    assert_response :success
  end

  test "should get show" do
    get public_post_workouts_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_workouts_edit_url
    assert_response :success
  end
end
