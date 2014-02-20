source 'https://rubygems.org'

# For Heroku
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# Just install node
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# Seriously?
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# We'll use slim for templating because why type more?
gem 'slim-rails'

# We'll use simple_form for easier forms
gem 'simple_form'

# We'll use draper to create nice logic-less views and wrap our model-like objects
gem 'draper'

# We'll use fob for form objects
gem 'fob'

# Twitter bootstrap because everyone else is
gem 'bootstrap-sass', '~> 3.1.0'

# Responsive Service for clean services
gem 'responsive_service'

# Authentication
gem 'omniauth'
gem 'omniauth-meetup'

group :development, :test do
  # We'll write our tests in rspec
  gem 'rspec-rails'

  # Feature specs are much nicer with capybara
  gem 'capybara'

  # Since we likely will have some javascript, we'll use poltergeist with capybara
  gem 'poltergeist'

  # We'll use shoulda since it makes several active model tests easy.
  gem 'shoulda'

  # Factories are nicer than fixtures so we'll use factory girl.
  # Note factories should only be used in integration tests.
  gem 'factory_girl_rails'

  # We need to clean up after our factories so we'll use database_cleaner
  gem 'database_cleaner'

  # Coverage reports are nice so we know how well we are sticking to TDD and full test coverage.
  # A service like Coveralls is also useful
  gem 'simplecov', require: false
  gem 'simplecov-html', require: false
  gem 'simplecov-rcov', require: false
  #gem 'coveralls', require: false

  # We'll use guard to do a lot of paying attention to things changing in our project.
  # This will autorun our tests and with spring that's fast.
  # It will also annotate our models as they change and live reload makes tweaking stuff in the view/css easier.
  gem 'guard'
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false
  gem 'ruby_gntp'
  gem 'guard-rspec'
  gem 'guard-livereload'

  # We'll use foreman to spin up all our processes in development. It uses the same procfile style as heroku.
  gem 'foreman'

  # We'll use letter_opener to test our mailers in development mode.
  gem 'letter_opener'

  # These gems here give us much nicer errors in the development environment
  gem 'better_errors'
  gem 'binding_of_caller'
  
  # There is an awesome Chrome extension for rails which gives you an extra tab on your dev tools
  # https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg?hl=en-US
  # To use it you need Meta Request
  gem 'meta_request'

  # Pry cause it's better
  gem 'pry-rails'
end

