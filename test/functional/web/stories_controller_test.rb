require 'test_helper'

class Web::StoriesControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    sign_in @user

    @story = create :story
  end

  test "should get stories" do
    @story = create :story

    get :index

    assert_response :success
  end

  test "should get new" do
    get :new

    assert_response :success
  end

  test "should create story" do
    attrs = attributes_for :story
    attrs[:sender_id] = @user.id

    post :create, story: attrs

    assert_response :redirect

    story = @user.sender_stories.find_by_name(attrs[:name])
    assert story
  end

  test "should show story" do
    get :show, id: @story

    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @story

    assert_response :success
  end

  test "should update story" do
    attrs = attributes_for :story

    put :update, id: @story, story: attrs

    assert_redirected_to story_path(@story)

    story = Story.find_by_name(attrs[:name])
    assert story
  end

  test "should destroy story" do
    delete :destroy, id: @story

    assert_response :redirect

    assert !Story.exists?(@story)
  end

  test "should update state story" do
    event = @story.state_events.first

    put :update_state, id: @story, event: event

    assert_response :success
  end

end
