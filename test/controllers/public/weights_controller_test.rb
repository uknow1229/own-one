require "test_helper"

class Public::WeightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_weights_index_url
    assert_response :success
  end

  test "should get show" do
    get public_weights_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_weights_edit_url
    assert_response :success
  end
end
