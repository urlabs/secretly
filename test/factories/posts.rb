# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    content { "Lorem ipsum dolor sit amet, consectetur adipisicing elit" }
    latitude { "99.99" }
    longitude { "19.99" }
  end
end
