require 'base_spec_helper'
Dir[File.join(RAILS_ROOT, "spec/support_fast/**/*.rb")].each {|f| require f}
%w{ actions services }.each do |dir|
  ActiveSupport::Dependencies.autoload_paths <<
    File.expand_path("../../app/#{dir}", __FILE__)
end