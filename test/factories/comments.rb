# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    commentable factory: :post
    content { "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris." }
  end
end
