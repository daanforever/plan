source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.3.6'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'jquery-rails'                    # Provides jQuery and the jQuery-ujs driver
gem 'haml'                            # HTML Abstraction Markup Language
gem 'simple_form'                     # Forms made easy for Rails!
gem 'responders'                      # A set of responders modules to dry up
gem 'settingson'                      # Settings management

gem 'http'                            # A fast Ruby HTTP client
gem 'faker'                           # A library for generating fake data

gem 'devise'                          # Flexible authentication solution for Rails with Warden
gem 'fie'                             # Frontend framework running over a WebSocket connection

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'       # Rails Console on the Browser
  gem 'rack-mini-profiler'            # Rails profiler
  gem 'annotate'                      # Annotate ActiveRecord models. Usage: annotate
  gem 'haml-rails'                    # Integration for HAML
  gem 'rubocop', require: false       # A Ruby static code analyzer and formatter
end

group :development, :test do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'         # Implements the rspec command for Spring
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'rspec-rails'                   # Test suite
  gem 'factory_bot_rails'             # Fixtures replacement
  gem 'database_cleaner'              # Helper gem for rspec
  gem 'simplecov', require: false     # Code coverage
  gem 'webmock', require: false       # Library for stubbing HTTP requests
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
