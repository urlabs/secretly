# frozen_string_literal: true

require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def comment
    @comment ||= build(:comment)
  end

  test "validity fo factory" do
    assert_predicate comment, :valid?
  end
end
