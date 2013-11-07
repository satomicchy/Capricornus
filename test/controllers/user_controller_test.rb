# -*- coding: utf-8 -*-
require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { name: "うさ", email: "usa@example.com", password: "usa_password", password_confirmation: "usa_password" }
    end

    assert_redirected_to users_path
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_redirected_to users_path
  end
end
