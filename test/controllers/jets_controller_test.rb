require 'test_helper'

class JetsControllerTest < ActionController::TestCase
  setup do
    @jet = jets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jet" do
    assert_difference('Jet.count') do
      post :create, jet: { description: @jet.description, jet_model: @jet.jet_model, make: @jet.make, price: @jet.price, serial_number: @jet.serial_number, title: @jet.title, year: @jet.year }
    end

    assert_redirected_to jet_path(assigns(:jet))
  end

  test "should show jet" do
    get :show, id: @jet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jet
    assert_response :success
  end

  test "should update jet" do
    patch :update, id: @jet, jet: { description: @jet.description, jet_model: @jet.jet_model, make: @jet.make, price: @jet.price, serial_number: @jet.serial_number, title: @jet.title, year: @jet.year }
    assert_redirected_to jet_path(assigns(:jet))
  end

  test "should destroy jet" do
    assert_difference('Jet.count', -1) do
      delete :destroy, id: @jet
    end

    assert_redirected_to jets_path
  end
end
