require 'test_helper'

class ArsenalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arsenal = arsenals(:one)
  end

  test "should get index" do
    get arsenals_url
    assert_response :success
  end

  test "should get new" do
    get new_arsenal_url
    assert_response :success
  end

  test "should create arsenal" do
    assert_difference('Arsenal.count') do
      post arsenals_url, params: { arsenal: { captain_id: @arsenal.captain_id, equipped: @arsenal.equipped, skyfarer_id: @arsenal.skyfarer_id, weapon_id: @arsenal.weapon_id } }
    end

    assert_redirected_to arsenal_url(Arsenal.last)
  end

  test "should show arsenal" do
    get arsenal_url(@arsenal)
    assert_response :success
  end

  test "should get edit" do
    get edit_arsenal_url(@arsenal)
    assert_response :success
  end

  test "should update arsenal" do
    patch arsenal_url(@arsenal), params: { arsenal: { captain_id: @arsenal.captain_id, equipped: @arsenal.equipped, skyfarer_id: @arsenal.skyfarer_id, weapon_id: @arsenal.weapon_id } }
    assert_redirected_to arsenal_url(@arsenal)
  end

  test "should destroy arsenal" do
    assert_difference('Arsenal.count', -1) do
      delete arsenal_url(@arsenal)
    end

    assert_redirected_to arsenals_url
  end
end
