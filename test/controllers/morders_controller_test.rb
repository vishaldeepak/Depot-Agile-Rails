require 'test_helper'

class MordersControllerTest < ActionController::TestCase
  setup do
    @morder = morders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:morders)
  end

  test "should get new" do
    item = LintItem.new
    item.build_cart
    item.product = products(:ruby)
    item.save!
    session[:cart_id] = item.cart.id
    get :new
    assert_response :success
  end

  test "should create morder" do
    assert_difference('Morder.count') do
      post :create, morder: { address: @morder.address, email: @morder.email, name: @morder.name, pay_type: @morder.pay_type }
    end

    assert_redirected_to store_path
  end

  test "should show morder" do
    get :show, id: @morder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @morder
    assert_response :success
  end

  test "should update morder" do
    patch :update, id: @morder, morder: { address: @morder.address, email: @morder.email, name: @morder.name, pay_type: @morder.pay_type }
    assert_redirected_to morder_path(assigns(:morder))
  end

  test "should destroy morder" do
    assert_difference('Morder.count', -1) do
      delete :destroy, id: @morder
    end

    assert_redirected_to morders_path
  end
 
  test "requires item in cart" do
    get :new
    assert_redirected_to store_path
    assert_equal flash[:notice], 'Your cart is empty'
  end


end
