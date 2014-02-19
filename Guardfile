# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec, version: 2, cli: "--color --format nested --tty" do
  watch(%r{^spec/actions/.+_spec\.rb$})
  watch(%r{^spec/forms/.+_spec\.rb$})
  watch(%r{^spec/services/.+_spec\.rb$})
  watch('spec/fast_spec_helper.rb')         { ["spec/actions","spec/forms","spec/services"] }
  watch(%r{^app/actions/(.+)\.rb$})         { |m| "spec/actions/#{m[1]}_spec.rb" }
  watch(%r{^app/forms/(.+)\.rb$})           { |m| "spec/forms/#{m[1]}_spec.rb" }
  watch(%r{^app/services/(.+)\.rb$})        { |m| "spec/services/#{m[1]}_spec.rb" }
  watch(%r{^spec/support_fast/(.+)\.rb$})   { ["spec/actions","spec/forms","spec/services"]}

  watch(%r{^spec/decorators/.+_spec\.rb$})
  watch('spec/decorator_spec_helper.rb')                  { "spec/decorators" }
  watch(%r{^app/decorators/(.+)\.rb$})                    { |m| "spec/decorators/#{m[1]}_spec.rb" }
  watch(%r{^spec/support_decorators/(.+)\.rb$})           { "spec/decorators" }

  watch(%r{^spec/models/.+_spec\.rb$})
  watch('spec/model_spec_helper.rb')                  { "spec/models" }
  watch(%r{^app/models/(.+)\.rb$})                    { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^spec/support_models/(.+)\.rb$})           { "spec/models" }
end

