require 'test_helper'

class CostsControllerTest < ActionController::TestCase
  setup do
    @cost = costs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costs)
  end

  test "should get new" do
    get :new, journal_id: journals(:today)
    assert_response :success
  end

  test "should create cost" do
    journal = journals(:today)
    assert_difference('Cost.count') do
      post :create, journal_id: journal.id, cost: { count: @cost.count, journal_id: @cost.journal_id, unit: @cost.unit, unit_price: @cost.unit_price }
    end

    assert_redirected_to journal_path(journal)
  end

  test "should show cost" do
    get :show, id: @cost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cost, journal_id: journals(:today)
    assert_response :success
  end

  test "should update cost" do
    patch :update, id: @cost, cost: { count: @cost.count, journal_id: @cost.journal_id, unit: @cost.unit, unit_price: @cost.unit_price }
    assert_redirected_to cost_path(assigns(:cost))
  end

  test "should destroy cost" do
    assert_difference('Cost.count', -1) do
      delete :destroy, id: @cost
    end

    assert_redirected_to costs_path
  end
end
