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

    assert signed_in?, 'fail in auth'
  end

  test "should unauth" do
    get :destroy

    assert !signed_in?
  end

end
