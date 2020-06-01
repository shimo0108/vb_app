source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"
gem "rails", "~> 5.2.4"
gem "sqlite3"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "turbolinks", "~> 5"
gem "bootsnap", ">= 1.1.0", require: false

# ログイン機能
gem "devise"
gem "omniauth-twitter"

# 日本語化
gem "rails-i18n", "~> 5.1"
gem "devise-i18n"

# Bootstrap
gem "bootstrap", "~> 4.4.1"
gem "jquery-rails"
gem "devise-bootstrap-views", "~> 1.0"

group :development, :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "spring-commands-rspec"
  gem "rubocop", require: false
  gem "rubocop-rails"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end
