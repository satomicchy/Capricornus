require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:fish_shop)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { address: @customer.address, email: @customer.email, fax: @customer.fax, name: @customer.name, president: @customer.president, tel: @customer.tel, zip: @customer.zip, company_id: @customer.company_id }
    end

    assert_not_nil assigns(:customer).company_id
    assert_redirected_to customers_path
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { address: @customer.address, email: @customer.email, fax: @customer.fax, name: @customer.name, president: @customer.president, tel: @customer.tel, zip: @customer.zip, company_id: @customer.company_id }

    assert_not_nil assigns(:customer).company_id
    assert_redirected_to customers_path
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
