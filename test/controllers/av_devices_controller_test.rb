require 'test_helper'

class AvDevicesControllerTest < ActionController::TestCase
  setup do
    @av_device = av_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:av_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create av_device" do
    assert_difference('AvDevice.count') do
      post :create, av_device: { asset_tag: @av_device.asset_tag, brand: @av_device.brand, device: @av_device.device, lease: @av_device.lease, lease_term: @av_device.lease_term, location: @av_device.location, model: @av_device.model, notes: @av_device.notes, owner_or_teacher: @av_device.owner_or_teacher, serial_number: @av_device.serial_number, status: @av_device.status, value: @av_device.value }
    end

    assert_redirected_to av_device_path(assigns(:av_device))
  end

  test "should show av_device" do
    get :show, id: @av_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @av_device
    assert_response :success
  end

  test "should update av_device" do
    patch :update, id: @av_device, av_device: { asset_tag: @av_device.asset_tag, brand: @av_device.brand, device: @av_device.device, lease: @av_device.lease, lease_term: @av_device.lease_term, location: @av_device.location, model: @av_device.model, notes: @av_device.notes, owner_or_teacher: @av_device.owner_or_teacher, serial_number: @av_device.serial_number, status: @av_device.status, value: @av_device.value }
    assert_redirected_to av_device_path(assigns(:av_device))
  end

  test "should destroy av_device" do
    assert_difference('AvDevice.count', -1) do
      delete :destroy, id: @av_device
    end

    assert_redirected_to av_devices_path
  end
end
