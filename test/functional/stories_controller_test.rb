require 'test_helper'

class StoriesControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    @story_attributes = attributes_for :story
  end

  test "should restrict access unauth user" do
    get :index
    assert_response :redirect
    #assert_not_nil assigns(:stories)
  end


  test "should access auth user" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create story" do
    sign_in @user
    assert_difference('Story.count') do
      post :create, story:  {text: @story_attributes[:text], name: @story_attributes[:name], reciver_id: @user.id}
    end

    assert_redirected_to story_path(assigns(:story))
  end

  test "should show story" do
    sign_in @user

    @story_instance = create :story

    get :show, id: @story_instance
    assert_response :success
  end

  test "should get edit" do
    sign_in @user

    @story_instance = create :story
    get :edit, id: @story_instance

    assert_response :success
  end

  test "should update story" do
    sign_in @user
    @story = create :story
    put :update, id: @story.id, story: { name: @story_attributes[:name], text: @story_attributes[:text], reciver_id: @user.id }
    assert_redirected_to story_path(@story)
  end

  test "should destroy story" do
    sign_in @user
    @story = create :story
    assert_difference('Story.count', -1) do
      delete :destroy, id: @story.id
    end

    assert_redirected_to stories_path
  end
end
