# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def user
    @user ||= build(:user)
  end

  test "validity fo factory" do
    assert_predicate user, :valid?
  end
end
