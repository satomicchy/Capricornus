require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @invoice = invoices(:october)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post :create, invoice: { ask_on: @invoice.ask_on, custom_id: @invoice.custom_id, deadline: @invoice.deadline, memo: @invoice.memo, number: @invoice.number, summary: @invoice.summary }
    end

    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should show invoice" do
    get :show, id: @invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice
    assert_response :success
  end

  test "should update invoice" do
    patch :update, id: @invoice, invoice: { ask_on: @invoice.ask_on, custom_id: @invoice.custom_id, deadline: @invoice.deadline, memo: @invoice.memo, number: @invoice.number, summary: @invoice.summary }
    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, id: @invoice
    end

    assert_redirected_to invoices_path
  end

  test "should get pdf" do
    get :export_pdf, invoice_id: @invoice, format: :pdf
    File.open(Rails.root.join("tmp", "test.pdf"), 'w:BINARY:UTF-8') do |f|
      f.write(response.body)
    end
    assert_response :success
  end
end
