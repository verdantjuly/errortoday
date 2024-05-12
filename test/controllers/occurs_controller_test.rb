require "test_helper"

class OccursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @occur = occurs(:one)
  end

  test "should get index" do
    get occurs_url
    assert_response :success
  end

  test "should get new" do
    get new_occur_url
    assert_response :success
  end

  test "should create occur" do
    assert_difference("Occur.count") do
      post occurs_url, params: { occur: { error_id: @occur.error_id, user_id: @occur.user_id } }
    end

    assert_redirected_to occur_url(Occur.last)
  end

  test "should show occur" do
    get occur_url(@occur)
    assert_response :success
  end

  test "should get edit" do
    get edit_occur_url(@occur)
    assert_response :success
  end

  test "should update occur" do
    patch occur_url(@occur), params: { occur: { error_id: @occur.error_id, user_id: @occur.user_id } }
    assert_redirected_to occur_url(@occur)
  end

  test "should destroy occur" do
    assert_difference("Occur.count", -1) do
      delete occur_url(@occur)
    end

    assert_redirected_to occurs_url
  end
end
