ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'

# Configure RSpec
RSpec.configure do |config|
  config.include Capybara::DSL, type: :request

  # Use the new `:expect` syntax
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  # Use the new `:assert` syntax
  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end

  # Use transactional fixtures
  config.use_transactional_fixtures = true

  # Run specs in random order to surface order dependencies
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option
  Kernel.srand config.seed

  # Configure Capybara with Selenium and Chrome
  Capybara.register_driver :selenium_chrome_headless do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args: %w[headless disable-gpu])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.javascript_driver = :selenium_chrome_headless
end
