require 'test_helper'

class JournalsControllerTest < ActionController::TestCase
  setup do
    @journal = journals(:today)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal" do
    assert_difference('Journal.count') do
      post :create, journal: { city: @journal.city, complete: @journal.complete, content: @journal.content, custom_id: @journal.custom_id, invoice_id: @journal.invoice_id, travel_expenses: @journal.travel_expenses, user_id: @journal.user_id, start_at: @journal.start_at }
    end

    assert_redirected_to journal_path(assigns(:journal))
  end

  test "should show journal" do
    get :show, id: @journal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journal
    assert_response :success
  end

  test "should update journal" do
    patch :update, id: @journal, journal: { city: @journal.city, complete: @journal.complete, content: @journal.content, custom_id: @journal.custom_id, invoice_id: @journal.invoice_id, travel_expenses: @journal.travel_expenses, user_id: @journal.user_id, start_at: @journal.start_at }
    assert_redirected_to journal_path(assigns(:journal))
  end

  test "should destroy journal" do
    assert_difference('Journal.count', -1) do
      delete :destroy, id: @journal
    end

    assert_redirected_to journals_path
  end
end
