# frozen_string_literal: true

require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = create(:post, user: default_user)
    passwordless_sign_in(default_user)
  end

  test "should get index" do
    get posts_url, headers: default_headers
    assert_response :success
  end

  test "should create post" do
    create_params = { post: { content: @post.content, latitude: @post.latitude, longitude: @post.longitude } }
    assert_difference("Post.count") do
      post posts_url, headers: default_headers, params: create_params.to_json
    end

    assert_response :success
  end

  test "should show post" do
    get post_url(@post), headers: default_headers
    assert_response :success
  end

  test "should update post" do
    update_params = { post: { content: "Updated content" } }
    patch post_url(@post), headers: default_headers, params: update_params.to_json

    assert_response :success
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post), headers: default_headers
    end

    assert_response :no_content
  end
end
