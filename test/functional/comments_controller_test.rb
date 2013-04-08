require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in(@user)
    @comment = attributes_for(:comment)
    @story = create :story
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, story_id: @comment[:story_id], comment: @comment
    end
  end

end
