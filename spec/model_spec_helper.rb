require 'base_spec_helper'
require 'active_record'
require 'rspec/rails/extensions/active_record/base'
require 'shoulda'
Dir[File.join(RAILS_ROOT, "spec/support_models/**/*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection adapter: "postgresql", database: "podium_test"
