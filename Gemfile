source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use BCrypt for has_secure_password
# See: http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
gem 'bcrypt', '~> 3.1.7'

group :development do
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Mutes console log entries for CSS, JavaScript, and other assets.
  # See: https://github.com/evrone/quiet_assets
  gem 'quiet_assets'
end

group :test, :development do
  # Use SQLite3 locally
  gem 'sqlite3'

  # Use dotenv with Rails
  # See: https://github.com/bkeepers/dotenv
  gem 'dotenv-rails'

  # RSpec for Rails
  # See: https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '~> 3.0.0'
end

group :test do
  # Useful for generating database entries for testing
  # See: https://github.com/thoughtbot/factory_girl_rails
  gem 'factory_girl_rails', '~> 4.0'

  # Useful for generating dummy data, e.g., fake email addresses
  # See: https://github.com/stympy/faker
  gem 'faker'

  # Useful Rails-specific RSpec matchers
  # See: https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers'
end

# Gems we need on Heroku but not locally
group :production do
  gem 'thin'
  gem 'pg'
  gem 'rails_12factor'
end
