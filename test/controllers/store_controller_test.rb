require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get view_cart" do
    get :view_cart
    assert_response :success
  end

  test "should get add_to_cart" do
    get :add_to_cart
    assert_response :success
  end

  test "should get empty_cart" do
    get :empty_cart
    assert_response :success
  end

end
