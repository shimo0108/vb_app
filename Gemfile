# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repoZZZZZZZZ}.git" }

ruby "2.6.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "puma", "~> 4.3"
gem "rails", "~> 5.2.4"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "websocket-extensions"
gem "faker"
gem "mini_magick"
gem "ransack"
gem "kaminari"
gem "dotenv-rails"
gem "font-awesome-sass", "~> 5.4.1"
gem "pg", "~> 0.19.0"

# ログイン機能
gem "devise"
gem "omniauth-twitter"
gem "omniauth-facebook"
gem "omniauth-google-oauth2"

# 日本語化
gem "devise-i18n"
gem "rails-i18n", "~> 5.1"

# Bootstrap
gem "bootstrap", "~> 4.4.1"
gem "devise-bootstrap-views", "~> 1.0"
gem "jquery-rails"

group :development, :test do
  gem "byebug", platforms: %i(mri mingw x64_mingw)
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rspec_junit_formatter"
end

group :development do
  gem "bullet"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop", require: false
  gem "rubocop-airbnb"
  gem "rubocop-rails"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
end

group :production do
end
