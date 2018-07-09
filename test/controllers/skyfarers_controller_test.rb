require 'test_helper'

class SkyfarersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skyfarer = skyfarers(:one)
  end

  test "should get index" do
    get skyfarers_url
    assert_response :success
  end

  test "should get new" do
    get new_skyfarer_url
    assert_response :success
  end

  test "should create skyfarer" do
    assert_difference('Skyfarer.count') do
      post skyfarers_url, params: { skyfarer: { base_attack: @skyfarer.base_attack, base_defense: @skyfarer.base_defense, captain_id: @skyfarer.captain_id, class: @skyfarer.class, name: @skyfarer.name, race: @skyfarer.race, state: @skyfarer.state } }
    end

    assert_redirected_to skyfarer_url(Skyfarer.last)
  end

  test "should show skyfarer" do
    get skyfarer_url(@skyfarer)
    assert_response :success
  end

  test "should get edit" do
    get edit_skyfarer_url(@skyfarer)
    assert_response :success
  end

  test "should update skyfarer" do
    patch skyfarer_url(@skyfarer), params: { skyfarer: { base_attack: @skyfarer.base_attack, base_defense: @skyfarer.base_defense, captain_id: @skyfarer.captain_id, class: @skyfarer.class, name: @skyfarer.name, race: @skyfarer.race, state: @skyfarer.state } }
    assert_redirected_to skyfarer_url(@skyfarer)
  end

  test "should destroy skyfarer" do
    assert_difference('Skyfarer.count', -1) do
      delete skyfarer_url(@skyfarer)
    end

    assert_redirected_to skyfarers_url
  end
end
