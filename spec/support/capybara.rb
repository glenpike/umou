# frozen_string_literal: true

require 'capybara/rspec'

Capybara.configure do |config|
  config.server = :puma, { Silent: true }
  config.always_include_port = true
end
