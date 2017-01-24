require 'test_helper'

class LightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @light = lights(:one)
  end

  test "should get index" do
    get lights_url
    assert_response :success
  end

  test "should get new" do
    get new_light_url
    assert_response :success
  end

  test "should create light" do
    assert_difference('Light.count') do
      post lights_url, params: { light: {  } }
    end

    assert_redirected_to light_url(Light.last)
  end

  test "should show light" do
    get light_url(@light)
    assert_response :success
  end

  test "should get edit" do
    get edit_light_url(@light)
    assert_response :success
  end

  test "should update light" do
    patch light_url(@light), params: { light: {  } }
    assert_redirected_to light_url(@light)
  end

  test "should destroy light" do
    assert_difference('Light.count', -1) do
      delete light_url(@light)
    end

    assert_redirected_to lights_url
  end
end
