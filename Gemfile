# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in is_my_sidekiq_ok.gemspec.
gemspec

group :development do
  gem 'sidekiq'
  gem 'sqlite3'
end
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false
# To use a debugger
# gem 'byebug', group: [:development, :test]
