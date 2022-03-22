# frozen_string_literal: true

require "test_helper"

class LikeControllerTest < ActionDispatch::IntegrationTest
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

  test "should create like" do
    assert_difference("Like.count") do
      post post_like_url(@post), headers: default_headers
    end

    assert_response :success
  end

  test "should destroy like" do
    @post.likes.create(user: user)
    assert_difference("Like.count", -1) do
      delete post_like_url(@post), headers: default_headers
    end

    assert_response :no_content
  end
end
