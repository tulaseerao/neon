require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  setup do
    @device = devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device" do
    assert_difference('Device.count') do
      post :create, device: { asset_tag: @device.asset_tag, assignment: @device.assignment, change: @device.change, computer_name: @device.computer_name, core: @device.core, cpu: @device.cpu, date_in_service: @device.date_in_service, device_type: @device.device_type, disposal_date: @device.disposal_date, ghz: @device.ghz, hdd: @device.hdd, key: @device.key, location: @device.location, mac1: @device.mac1, mac2: @device.mac2, manufacturer: @device.manufacturer, screen: @device.screen, serial_number: @device.serial_number }
    end

    assert_redirected_to device_path(assigns(:device))
  end

  test "should show device" do
    get :show, id: @device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device
    assert_response :success
  end

  test "should update device" do
    patch :update, id: @device, device: { asset_tag: @device.asset_tag, assignment: @device.assignment, change: @device.change, computer_name: @device.computer_name, core: @device.core, cpu: @device.cpu, date_in_service: @device.date_in_service, device_type: @device.device_type, disposal_date: @device.disposal_date, ghz: @device.ghz, hdd: @device.hdd, key: @device.key, location: @device.location, mac1: @device.mac1, mac2: @device.mac2, manufacturer: @device.manufacturer, screen: @device.screen, serial_number: @device.serial_number }
    assert_redirected_to device_path(assigns(:device))
  end

  test "should destroy device" do
    assert_difference('Device.count', -1) do
      delete :destroy, id: @device
    end

    assert_redirected_to devices_path
  end
end
