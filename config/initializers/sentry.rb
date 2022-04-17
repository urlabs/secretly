# frozen_string_literal: true

if ENV["SENTRY_DNS"].present?
  Sentry.init do |config|
    config.dsn = ENV["SENTRY_DNS"]
    config.breadcrumbs_logger = %i[active_support_logger http_logger]
    config.traces_sample_rate = 0.85
  end
end
