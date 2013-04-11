require 'test_helper'

class Web::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in(@user)
    @comment = attributes_for(:comment)
    @story = create :story
  end

  test "should create comment with ajax" do
    assert_difference('Comment.count') do
      xhr :post, :create, story_id: @story.id, comment: @comment
    end
  end

end
