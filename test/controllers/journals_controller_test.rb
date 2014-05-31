require 'test_helper'

class JournalsControllerTest < ActionController::TestCase
  setup do
    @journal = journals(:today)
  end

  test "should get index" do
    get :index, year: "2013", month: "12"
    assert_response :success
    assert_not_nil assigns(:journals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal" do
    assert_difference('Journal.count') do
      post :create, journal: { city: @journal.city, complete: @journal.complete, content: @journal.content, customer_id: @journal.customer_id, invoice_id: @journal.invoice_id, user_id: @journal.user_id, start_at: @journal.start_at, finish_at: @journal.finish_at }
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
    patch :update, id: @journal, journal: { city: @journal.city, complete: @journal.complete, content: @journal.content, customer_id: @journal.customer_id, invoice_id: @journal.invoice_id, user_id: @journal.user_id, start_at: @journal.start_at }
    assert_redirected_to journal_path(assigns(:journal))
  end

  test "should destroy journal" do
    assert_difference('Journal.count', -1) do
      delete :destroy, id: @journal
    end

    assert_redirected_to root_path
  end

  test "should update_all journal" do
    @invoice = invoices(:october)
    @journal = journals(:fishing)
    patch :update_all, invoice_id: @invoice.id, alone_journal_ids: [@journal.id.to_s]
  end
end
