# frozen_string_literal: true

require "test_helper"

module Api
  class PostsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @post = create(:post, user: default_user)
      passwordless_sign_in(default_user)
    end

    test "should get index" do
      get api_posts_url, headers: default_headers
      assert_response :success
    end

    test "should create post" do
      create_params = { post: { content: @post.content, latitude: @post.latitude, longitude: @post.longitude } }
      assert_difference("Post.count") do
        post api_posts_url, headers: default_headers, params: create_params.to_json
      end

      assert_response :success
    end

    test "should show post" do
      get api_post_url(@post), headers: default_headers
      assert_response :success
    end

    test "should update post" do
      update_params = { post: { content: "Updated content" } }
      patch api_post_url(@post), headers: default_headers, params: update_params.to_json

      assert_response :success
    end

    test "should destroy post" do
      assert_difference("Post.count", -1) do
        delete api_post_url(@post), headers: default_headers
      end

      assert_response :no_content
    end
  end
end
