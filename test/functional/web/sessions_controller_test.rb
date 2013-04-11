require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase

  setup do
    @user = create :user
  end

  test "should get new" do
    get :new

    assert_response :success
  end

  test "should auth" do
    attrs = attributes_for :user

    post :create, attrs

    assert_response :redirect

    assert signed_in?, 'fail in auth'
  end

  test "shold show login form if invalid login/password" do
    post :create, {}

    assert_template :new
  end

  test "should unauth" do
    get :destroy

    assert_response :redirect

    assert !signed_in?
  end

end
