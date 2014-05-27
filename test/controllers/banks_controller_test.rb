require 'test_helper'

class BanksControllerTest < ActionController::TestCase
  setup do
    @bank = banks(:gold)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:banks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bank" do
    assert_difference('Bank.count') do
      post :create, bank: { branch: @bank.branch, name: @bank.name, number: @bank.number, type: @bank.type, account_holder: @bank.account_holder, company_id: @bank.company_id }
    end

    assert_not_nil assigns(:bank).company_id
    assert_redirected_to banks_path
  end

  test "should get edit" do
    get :edit, id: @bank
    assert_response :success
  end

  test "should update bank" do
    patch :update, id: @bank, bank: { branch: @bank.branch, name: @bank.name, number: @bank.number, type: @bank.type }

    assert_not_nil assigns(:bank).company_id
    assert_redirected_to banks_path
  end

  test "should destroy bank" do
    assert_difference('Bank.count', -1) do
      delete :destroy, id: @bank
    end

    assert_redirected_to banks_path
  end
end
