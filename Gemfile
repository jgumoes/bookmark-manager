source 'http://rubygems.org'

ruby '2.6.5'

gem 'puma'
gem 'sinatra'

group :development do
  gem 'rack'
  gem 'shotgun'
end

group :development, :test do
  gem 'rubocop', '0.79.0'
end

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'rspec-sinatra'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
