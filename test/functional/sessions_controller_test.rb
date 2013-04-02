require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  setup do
    @user = create :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should auth" do
    post :create, {email: @user.email, password: @user.password}
    assert_equal 'Logged in!', flash[:notice]
    assert_response :redirect
    assert signed_in?, 'fail in auth'
  end

  test "should unauth" do
    get :destroy
    assert_response :redirect
    assert !signed_in?
  end

end
