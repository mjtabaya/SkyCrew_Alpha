require 'test_helper'

class CaptainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @captain = captains(:one)
  end

  test "should get index" do
    get captains_url
    assert_response :success
  end

  test "should get new" do
    get new_captain_url
    assert_response :success
  end

  test "should create captain" do
    assert_difference('Captain.count') do
      post captains_url, params: { captain: { name: @captain.name, user_id: @captain.user_id } }
    end

    assert_redirected_to captain_url(Captain.last)
  end

  test "should show captain" do
    get captain_url(@captain)
    assert_response :success
  end

  test "should get edit" do
    get edit_captain_url(@captain)
    assert_response :success
  end

  test "should update captain" do
    patch captain_url(@captain), params: { captain: { name: @captain.name, user_id: @captain.user_id } }
    assert_redirected_to captain_url(@captain)
  end

  test "should destroy captain" do
    assert_difference('Captain.count', -1) do
      delete captain_url(@captain)
    end

    assert_redirected_to captains_url
  end
end
