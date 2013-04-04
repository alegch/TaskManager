require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in(@user)
    @comment = attributes_for(:comment)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { body: @comment[:body], commenter: @comment[:commenter] }
    end
  end

end
