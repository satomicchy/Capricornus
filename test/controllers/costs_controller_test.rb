require 'test_helper'

class CostsControllerTest < ActionController::TestCase
  setup do
    @cost = costs(:one)
    @journal = journals(:today)
  end

  test "should get new" do
    get :new, journal_id: journals(:today)
    assert_response :success
  end

  test "should create cost" do
    assert_difference('Cost.count') do
      post :create, journal_id: @journal.id, cost: { count: @cost.count, journal_id: @cost.journal_id, unit: @cost.unit, unit_price: @cost.unit_price }
    end

    assert_redirected_to journal_path(@journal)
  end

  test "should get edit" do
    get :edit, id: @cost, journal_id: @journal.id
    assert_response :success
  end

  test "should update cost" do
    patch :update, journal_id: @journal.id, id: @cost, cost: { count: @cost.count, journal_id: @cost.journal_id, unit: @cost.unit, unit_price: @cost.unit_price }
    assert_redirected_to journal_path(@journal)
  end

  test "should destroy cost" do
    assert_difference('Cost.count', -1) do
      delete :destroy, id: @cost, journal_id: @journal.id
    end

    assert_redirected_to @journal
  end
end
