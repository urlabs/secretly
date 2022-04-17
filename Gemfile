# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "pg", "~> 1.3"
gem "puma", "~> 5.6"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"

gem "importmap-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"

gem "image_processing", "~> 1.2"
gem "jbuilder"
gem "passwordless", "~> 0.10.0"
gem "redis", "~> 4.0"
# gem "kredis"

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "rubocop", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
end

group :development do
  gem "rack-mini-profiler"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
