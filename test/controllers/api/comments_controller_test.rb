# frozen_string_literal: true

require "test_helper"

module Api
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @post = create(:post, user: default_user)
      @comment = @post.comments.create(user: default_user, content: "a test comment")
      passwordless_sign_in(default_user)
    end

    test "should get index" do
      get api_post_comments_url(@post), headers: default_headers
      assert_response :success
    end

    test "should create comment" do
      create_params = { comment: { content: "A comment" } }
      assert_difference("Comment.count") do
        post api_post_comments_url(@post), headers: default_headers, params: create_params.to_json
      end

      assert_response :success
    end

    test "should show comment" do
      get api_post_comment_url(@post, @comment), headers: default_headers
      assert_response :success
    end

    test "should update comment" do
      update_params = { comment: { content: "Updated content" } }
      patch api_post_comment_url(@post, @comment), headers: default_headers, params: update_params.to_json

      assert_response :success
    end

    test "should destroy comment" do
      assert_difference("Comment.count", -1) do
        delete api_post_comment_url(@post, @comment), headers: default_headers
      end

      assert_response :no_content
    end
  end
end
