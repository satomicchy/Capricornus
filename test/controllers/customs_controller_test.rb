require 'test_helper'

class CustomsControllerTest < ActionController::TestCase
  setup do
    @custom = customs(:fish_shop)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom" do
    assert_difference('Custom.count') do
      post :create, custom: { address: @custom.address, email: @custom.email, fax: @custom.fax, name: @custom.name, president: @custom.president, tel: @custom.tel, zip: @custom.zip, company_id: @custom.company_id }
    end

    assert_not_nil assigns(:custom).company_id
    assert_redirected_to customs_path
  end

  test "should show custom" do
    get :show, id: @custom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom
    assert_response :success
  end

  test "should update custom" do
    patch :update, id: @custom, custom: { address: @custom.address, email: @custom.email, fax: @custom.fax, name: @custom.name, president: @custom.president, tel: @custom.tel, zip: @custom.zip, company_id: @custom.company_id }

    assert_not_nil assigns(:custom).company_id
    assert_redirected_to customs_path
  end

  test "should destroy custom" do
    assert_difference('Custom.count', -1) do
      delete :destroy, id: @custom
    end

    assert_redirected_to customs_path
  end
end
