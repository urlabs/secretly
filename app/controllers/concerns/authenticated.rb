# frozen_string_literal: true

module Authenticated
  extend ActiveSupport::Concern

  included do
    include Passwordless::ControllerHelpers
    def current_user
      @current_user ||= authenticate_by_session(User)
    end
    helper_method :current_user

    def authenticate_user!
      return if current_user

      redirect_to root_path, flash: { error: "You are not authenticated!" }
    end
  end
end
