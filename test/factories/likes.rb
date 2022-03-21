# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    likeable { nil }
    user { nil }
  end
end
