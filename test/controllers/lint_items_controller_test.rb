require 'test_helper'

class LintItemsControllerTest < ActionController::TestCase
  setup do
    @lint_item = lint_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lint_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LintItem.count') do
      post :create, product_id: products(:ruby).id
    end

    assert_redirected_to cart_path(assigns(:lint_item).cart)
  end

  test "should show lint_item" do
    get :show, id: @lint_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lint_item
    assert_response :success
  end

  test "should update lint_item" do
    patch :update, id: @lint_item, lint_item: { cart_id: @lint_item.cart_id, product_id: @lint_item.product_id }
    assert_redirected_to lint_item_path(assigns(:lint_item))
  end

  test "should destroy lint_item" do
    assert_difference('LintItem.count', -1) do
      delete :destroy, id: @lint_item
    end

    assert_redirected_to lint_items_path
  end

  
end
