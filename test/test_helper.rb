# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/mock"
# require "passwordless/test_helpers"

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
    parallelize(workers: :number_of_processors)

    def passwordless_sign_in(resource)
      session = Passwordless::Session.create!(authenticatable: resource, user_agent: "TestAgent",
                                              remote_addr: "unknown")
      get Passwordless::Engine.routes.url_helpers.token_sign_in_path(session.token)
      follow_redirect!
    end

    def default_user
      @default_user ||= create(:user)
    end

    def default_headers
      @default_headers ||= {
        "Accept" => "application/vnd.secretly.v1+json",
        "Content-Type" => "application/json"
      }
    end
  end
end
