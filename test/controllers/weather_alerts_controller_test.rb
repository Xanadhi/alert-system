require 'test_helper'

class WeatherAlertsControllerTest < ActionController::TestCase
  setup do
    @weather_alert = weather_alerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weather_alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weather_alert" do
    assert_difference('WeatherAlert.count') do
      post :create, weather_alert: {  }
    end

    assert_redirected_to weather_alert_path(assigns(:weather_alert))
  end

  test "should show weather_alert" do
    get :show, id: @weather_alert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weather_alert
    assert_response :success
  end

  test "should update weather_alert" do
    patch :update, id: @weather_alert, weather_alert: {  }
    assert_redirected_to weather_alert_path(assigns(:weather_alert))
  end

  test "should destroy weather_alert" do
    assert_difference('WeatherAlert.count', -1) do
      delete :destroy, id: @weather_alert
    end

    assert_redirected_to weather_alerts_path
  end
end
