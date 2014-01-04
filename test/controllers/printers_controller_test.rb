require 'test_helper'

class PrintersControllerTest < ActionController::TestCase
  setup do
    @printer = printers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:printers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create printer" do
    assert_difference('Printer.count') do
      post :create, printer: { asset_tag: @printer.asset_tag, comment: @printer.comment, host_server: @printer.host_server, ip_address: @printer.ip_address, location: @printer.location, printer: @printer.printer, serial_number: @printer.serial_number, win_7: @printer.win_7, win_xp: @printer.win_xp }
    end

    assert_redirected_to printer_path(assigns(:printer))
  end

  test "should show printer" do
    get :show, id: @printer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @printer
    assert_response :success
  end

  test "should update printer" do
    patch :update, id: @printer, printer: { asset_tag: @printer.asset_tag, comment: @printer.comment, host_server: @printer.host_server, ip_address: @printer.ip_address, location: @printer.location, printer: @printer.printer, serial_number: @printer.serial_number, win_7: @printer.win_7, win_xp: @printer.win_xp }
    assert_redirected_to printer_path(assigns(:printer))
  end

  test "should destroy printer" do
    assert_difference('Printer.count', -1) do
      delete :destroy, id: @printer
    end

    assert_redirected_to printers_path
  end
end
