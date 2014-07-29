require 'base_spec_helper'

require 'active_record'
require 'active_support/test_case'
require 'active_record/fixtures'

require 'rails/version'
require 'rspec/rails/extensions/active_record/base'
require 'rspec/rails/adapters'
require 'rspec/rails/fixture_support'

require 'database_cleaner'
Dir[File.join(RAILS_ROOT, 'spec/support_db_integration/**/*.rb')].each { |f| require f }

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

ActiveRecord::Base.establish_connection(
  YAML.load(File.read(RAILS_ROOT + '/config/database.yml'))['test']
)

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

ActiveSupport::Dependencies.autoload_paths << "#{RAILS_ROOT}/app/models"
ActiveSupport::Dependencies.autoload_paths << "#{RAILS_ROOT}/app/models/concerns"
ActiveSupport::Dependencies.autoload_paths << "#{RAILS_ROOT}/app/services"

