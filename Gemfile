# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

gem 'rails', '~> 7.0.2', '>= 7.0.2.4'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'csv'
gem 'rubocop'
gem 'rubocop-rails'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false


group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'faker'
end
