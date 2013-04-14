require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase

  setup do
    @attrs = attributes_for :user
  end

  test "should get new" do
    get :new

    assert_response :success
  end

  test "should create user" do
    @attrs[:password_confirmation] = @attrs[:password]
    post :create, user_registration_type: @attrs

    user = User.find_by_email(@attrs[:email])
    assert user
  end

  test "should show registration form if not save user" do
    post :create, user: {}

    assert_response :success
    assert_template :new
  end

end
