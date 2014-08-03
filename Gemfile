source 'https://rubygems.org'

# Declare your gem's dependencies in activeadmin-mongoid.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem 'activeadmin', github: 'Zhomart/active_admin'

# Test app stuff

# gem 'rails', '~> 4.0.0'

gem 'ransack', github: 'Zhomart/ransack', branch: 'mongoid'

gem 'pry'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jslint'

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'launchy'
  gem 'simplecov', require: false
end
