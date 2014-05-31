require 'test_helper'

class EstimatesControllerTest < ActionController::TestCase
  setup do
    @estimate = estimates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estimates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estimate" do
    assert_difference('Estimate.count') do
      post :create, estimate: { customer_id: @estimate.customer_id, deadline: @estimate.deadline, memo: @estimate.memo, number: @estimate.number, requirement: @estimate.requirement, summary: @estimate.summary, title: @estimate.title }
    end

    assert_redirected_to estimate_path(assigns(:estimate))
  end

  test "should show estimate" do
    get :show, id: @estimate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estimate
    assert_response :success
  end

  test "should update estimate" do
    patch :update, id: @estimate, estimate: { customer_id: @estimate.customer_id, deadline: @estimate.deadline, memo: @estimate.memo, number: @estimate.number, requirement: @estimate.requirement, summary: @estimate.summary, title: @estimate.title }
    assert_redirected_to estimate_path(assigns(:estimate))
  end

  test "should destroy estimate" do
    assert_difference('Estimate.count', -1) do
      delete :destroy, id: @estimate
    end

    assert_redirected_to estimates_path
  end
end
