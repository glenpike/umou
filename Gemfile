# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'activeresource', '~> 6.0'
gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.8'
  gem 'rubocop-rails', '~> 2.17'
  gem 'rubocop-performance', '~> 1.15'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem 'capybara', '~> 3.38'
  gem 'database_cleaner', '~> 2.0'
  gem 'guard-rspec', '~> 4.7'
  gem 'rspec-rails', '~> 6.0'
  gem 'rubocop-rspec', '~> 2.16'
  gem 'selenium-webdriver', '~> 4.7'
  gem 'simplecov', '~> 0.22.0'
  gem 'webdrivers', '~> 5.2'
end
