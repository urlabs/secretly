# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers

  def index; end

  elper_method :current_user

  protected

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def require_user!
    return if current_user

    redirect_to root_path, flash: { error: "You are not worthy!" }
  end
end
