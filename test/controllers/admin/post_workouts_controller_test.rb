require "test_helper"

class Admin::PostWorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_workouts_index_url
    assert_response :success
  end
end
