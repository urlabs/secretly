# frozen_string_literal: true

require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  def user
    @user ||= create(:user)
  end

  def default_headers
    @default_headers ||= { "Accept" => "application/vnd.secretly.v1+json" }
  end

  setup do
    @post = create(:post, user: user)
    passwordless_sign_in(user)
  end

  test "should get index" do
    get posts_url, headers: default_headers
    assert_response :success
  end

  test "should create post" do
    create_params = { post: { content: @post.content, latitude: @post.latitude, longitude: @post.longitude } }
    assert_difference("Post.count") do
      post posts_url, headers: default_headers, params: create_params
    end

    assert_response :success
  end

  test "should show post" do
    get post_url(@post), headers: default_headers
    assert_response :success
  end

  test "should update post" do
    update_params = { post: { content: "Updated content", latitude: @post.latitude, longitude: @post.longitude } }
    patch post_url(@post), headers: default_headers, params: update_params

    assert_response :success
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post), headers: default_headers
    end

    assert_response :no_content
  end
end
