require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:mycompany)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { address: @company.address, email: @company.email, fax: @company.fax, name: @company.name, president: @company.president, tel: @company.tel, zip: @company.zip, close_day: @company.close_day }
    end

    assert_redirected_to companies_path
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    patch :update, id: @company, company: { address: @company.address, email: @company.email, fax: @company.fax, name: @company.name, president: @company.president, tel: @company.tel, zip: @company.zip }
    assert_redirected_to companies_path
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
