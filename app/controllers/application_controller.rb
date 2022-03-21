# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authenticated

  def index; end
end
