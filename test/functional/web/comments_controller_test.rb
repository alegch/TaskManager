require 'test_helper'

class Web::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in(@user)
    @story = create :story
  end

  test "should create comment with ajax" do
    attrs = attributes_for(:comment)
    attrs[:story_id] = @story.id
    xhr :post, :create, story_id: @story.id, comment: attrs

    comment = @story.comments.find_by_body(attrs[:body])

    assert comment
  end

end
