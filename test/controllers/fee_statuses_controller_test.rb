require 'test_helper'

class FeeStatusesControllerTest < ActionController::TestCase
  setup do
    @fee_status = fee_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fee_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fee_status" do
    assert_difference('FeeStatus.count') do
      post :create, fee_status: { amount_paid: @fee_status.amount_paid, paid_date: @fee_status.paid_date }
    end

    assert_redirected_to fee_status_path(assigns(:fee_status))
  end

  test "should show fee_status" do
    get :show, id: @fee_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fee_status
    assert_response :success
  end

  test "should update fee_status" do
    patch :update, id: @fee_status, fee_status: { amount_paid: @fee_status.amount_paid, paid_date: @fee_status.paid_date }
    assert_redirected_to fee_status_path(assigns(:fee_status))
  end

  test "should destroy fee_status" do
    assert_difference('FeeStatus.count', -1) do
      delete :destroy, id: @fee_status
    end

    assert_redirected_to fee_statuses_path
  end
end
