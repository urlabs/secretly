# frozen_string_literal: true

require "test_helper"

class PostTest < ActiveSupport::TestCase
  def post
    @post ||= build(:post)
  end

  test "validity fo factory" do
    assert_predicate post, :valid?
  end
end
