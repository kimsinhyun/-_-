source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.1"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 1.4"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.13"

# Default avatar
gem "letter_avatar", "~> 0.3.9"

# database
gem "pg", "~> 1.5", ">= 1.5.8"

# css framework
gem "tailwindcss-rails", "~> 2.7"

# localization
gem "rails-i18n", "~> 7.0.0"

# authentication
gem "devise", "~> 4.9", ">= 4.9.4"
gem "devise-i18n", "~> 1.12", ">= 1.12.1"
gem "omniauth", "~> 2.1", ">= 2.1.1"
gem "omniauth-google-oauth2", "~> 1.1", ">= 1.1.1"
gem "omniauth-rails_csrf_protection", "~> 1.0", ">= 1.0.2"

# redis
gem "redis", ">= 4.0.1"
gem "redis-rails", "~> 5.0", ">= 5.0.2"
gem "redis-session-store","~> 0.11.5"

gem "font-awesome-rails", "~> 4.7", ">= 4.7.0.8"

gem "view_component", "~> 3.14"

gem "sidekiq", "~> 7.3"
gem "sidekiq-cron", "~> 1.12"
gem "sidekiq-unique-jobs", "~> 8.0", ">= 8.0.2"

# pagination
gem 'pagy', '~> 9.0', '>= 9.0.9'


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  gem "dotenv-rails"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  gem "rubocop", "~> 1.54", ">= 1.54.1"
  gem "rubocop-performance", "~> 1.18"
  gem "rubocop-rails", "~> 2.20", ">= 2.20.2"
  gem "rubocop-rspec", "~> 2.22"

  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 3.2"
  gem "rspec-rails", "~> 6.1"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

  gem "rspec-sidekiq", "~> 4.1"
end
