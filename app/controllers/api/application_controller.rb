# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    include Authenticated
    include ActionController::MimeResponds
  end
end
