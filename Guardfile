guard :rspec, notification: true, cmd: 'rspec', spec_paths: ["spec/actions", "spec/db_integration", "spec/decorators", "spec/features", "spec/forms", "spec/models", "spec/services"] do
  watch(%r{^spec/(actions|db_integration|decorators|features|forms|models|services)/.+_spec\.rb$})
  watch(%r{^spec/(actions|db_integration|decorators|features|forms|models|services)_spec_helper\.rb$}) { |m| "spec/#{m[1]}" }
  watch(%r{^spec/support_(actions|db_integration|decorators|features|forms|models|services)/(.+)\.rb$}) { |m| "spec/#{m[1]}" }
  watch(%r{^app/(actions|db_integration|decorators|features|forms|models|services)/(.+)\.rb$}) { |m| "spec/#{m[1]}/#{m[2]}_spec.rb" }
  
  watch('/spec/base_spec_helper.rb') { ["spec/actions", "spec/db_integration", "spec/decorators", "spec/features", "spec/forms", "spec/models", "spec/services"] }
  watch(%r{^spec/support_common/(.+)\.rb$}) { ["spec/actions", "spec/db_integration", "spec/decorators", "spec/features", "spec/forms", "spec/models", "spec/services"] }
end
