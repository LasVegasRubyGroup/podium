require 'base_spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
Dir[Rails.root.join('spec/support_features/**/*.rb')].each { |f| require f }
require 'factory_girl'
require 'database_cleaner'

Capybara.javascript_driver = :poltergeist
DatabaseCleaner.strategy = :truncation
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.include FactoryGirl::Syntax::Methods

  config.before(:each) do
    if [:request, :feature].include? example.metadata[:type]
      Capybara.current_driver = :poltergeist
    else
      Capybara.use_default_driver
    end
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
