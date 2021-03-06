# require 'capybara/rspec'

# Capybara.configure do |config|
#   config.default_driver = :selenium_chrome_headless
# end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    stub_const('Sms', FakeSms)
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end


