require 'test_helper'

class UsersControllerTest < ActionController::TestCase
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

    assert_equal 'Signed up!', flash[:notice]
    assert_redirected_to root_url
  end
end
