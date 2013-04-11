require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase

  setup do
    @user = users(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {email: @user.email, password: @user.password_digest, password_confirmation: @user.password_digest}
    end
  end
end
