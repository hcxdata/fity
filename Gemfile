source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'sqlite3'
gem "mysql2"
gem 'sdoc', '~> 0.4.0', group: :doc

gem "fume-settable", "0.0.3"
gem 'twitter', '5.13.0'
gem "koala", "1.11.1"
gem "youtube_it"


# model
gem "carrierwave", "0.10.0"

# background
gem "whenever", "~> 0.9.3", require: false
gem "sidekiq", "3.2.6"
gem "sinatra", ">= 1.4.4"
gem "slim", ">= 2.0.0"

# views
gem 'jbuilder', '~> 2.0'

# assets
gem 'jquery-rails'

gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 1.3.0'

# gem 'therubyracer', platforms: :ruby

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'

  gem 'annotate'
  gem 'rspec-rails', '3.2.0'
  gem 'factory_girl_rails', '4.5.0'
end

gem 'pry-rails'

group :development do
  gem "capsum", "~> 1.0.2", require: false
  gem "capistrano-sidekiq", "~> 0.3.5", require: false
end

group :test do
  gem 'vcr', '2.9.3'
  gem 'webmock', '1.20.4'
end
