require 'test_helper'

class ZombiedataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zombiedatum = zombiedata(:one)
  end

  test "should get index" do
    get zombiedata_url
    assert_response :success
  end

  test "should get new" do
    get new_zombiedatum_url
    assert_response :success
  end

  test "should create zombiedatum" do
    assert_difference('Zombiedatum.count') do
      post zombiedata_url, params: { zombiedatum: {  } }
    end

    assert_redirected_to zombiedatum_url(Zombiedatum.last)
  end

  test "should show zombiedatum" do
    get zombiedatum_url(@zombiedatum)
    assert_response :success
  end

  test "should get edit" do
    get edit_zombiedatum_url(@zombiedatum)
    assert_response :success
  end

  test "should update zombiedatum" do
    patch zombiedatum_url(@zombiedatum), params: { zombiedatum: {  } }
    assert_redirected_to zombiedatum_url(@zombiedatum)
  end

  test "should destroy zombiedatum" do
    assert_difference('Zombiedatum.count', -1) do
      delete zombiedatum_url(@zombiedatum)
    end

    assert_redirected_to zombiedata_url
  end
end
