require 'base_spec_helper'
require 'draper'
Dir[File.join(RAILS_ROOT, "spec/support_decorators/**/*.rb")].each {|f| require f}

Draper::ViewContext.test_strategy :fast

ActiveSupport::Dependencies.autoload_paths << File.expand_path('../../app/decorators', __FILE__)