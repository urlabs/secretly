# frozen_string_literal: true

class ApiController < ActionController::API
  include Authenticated
  include ActionController::MimeResponds
end
