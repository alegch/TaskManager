require 'test_helper'

class StoriesControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    sign_in @user

    @story_attributes = attributes_for :story
  end

  test "should get stories" do
    @story_instance = create :story

    get :index

    assert_response :success
  end

  test "should get new" do
    get :new

    assert_response :success
  end

  test "should create story" do
    assert_difference('Story.count') do
      post :create, story:  {text: @story_attributes[:text], name: @story_attributes[:name], reciver_id: @user.id}
    end
  end

  test "should show story" do
    @story_instance = create :story

    get :show, id: @story_instance.id

    assert_response :success
  end

  test "should get edit" do
    @story_instance = create :story

    get :edit, id: @story_instance.id

    assert_response :success
  end

  test "should update story" do
    @story = create :story

    put :update, id: @story.id, story: { name: @story_attributes[:name], text: @story_attributes[:text], reciver_id: @user.id }

    assert_redirected_to story_path(@story)
  end

  test "should destroy story" do
    @story = create :story

    assert_difference('Story.count', -1) do
      delete :destroy, id: @story.id
    end
  end

end
