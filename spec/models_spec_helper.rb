require 'base_spec_helper'
require 'active_record'
require 'rspec/rails/extensions/active_record/base'

Dir[File.join(RAILS_ROOT, 'spec/support_models/**/*.rb')].each { |f| require f }

ActiveRecord::Base.establish_connection(
  YAML.load(File.read(RAILS_ROOT + '/config/database.yml'))['test']
)

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

ActiveSupport::Dependencies.autoload_paths << "#{RAILS_ROOT}/app/models"
ActiveSupport::Dependencies.autoload_paths << "#{RAILS_ROOT}/app/models/concerns"
