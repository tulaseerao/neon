require 'test_helper'

class IdevicesControllerTest < ActionController::TestCase
  setup do
    @idevice = idevices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:idevices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idevice" do
    assert_difference('Idevice.count') do
      post :create, idevice: { asset_tag: @idevice.asset_tag, capacity_hd: @idevice.capacity_hd, device_type: @idevice.device_type, model_number: @idevice.model_number, name: @idevice.name, serial_number: @idevice.serial_number }
    end

    assert_redirected_to idevice_path(assigns(:idevice))
  end

  test "should show idevice" do
    get :show, id: @idevice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idevice
    assert_response :success
  end

  test "should update idevice" do
    patch :update, id: @idevice, idevice: { asset_tag: @idevice.asset_tag, capacity_hd: @idevice.capacity_hd, device_type: @idevice.device_type, model_number: @idevice.model_number, name: @idevice.name, serial_number: @idevice.serial_number }
    assert_redirected_to idevice_path(assigns(:idevice))
  end

  test "should destroy idevice" do
    assert_difference('Idevice.count', -1) do
      delete :destroy, id: @idevice
    end

    assert_redirected_to idevices_path
  end
end
