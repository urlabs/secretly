# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "noreply@urlabs.app"
  layout "mailer"
end
