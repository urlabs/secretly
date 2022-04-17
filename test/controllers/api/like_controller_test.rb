# frozen_string_literal: true

require "test_helper"

module Api
  class LikeControllerTest < ActionDispatch::IntegrationTest
    setup do
      @post = create(:post, user: default_user)
      passwordless_sign_in(default_user)
    end

    test "should create like" do
      assert_difference("Like.count") do
        post api_post_like_url(@post), headers: default_headers
      end

      assert_response :success
    end

    test "should destroy like" do
      @post.likes.create(user: default_user)
      assert_difference("Like.count", -1) do
        delete api_post_like_url(@post), headers: default_headers
      end

      assert_response :no_content
    end
  end
end
