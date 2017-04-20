source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '>= 5.0.0.rc2', '< 5.1'
gem 'sass-rails', '~> 5.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'pg'
gem 'jquery-atwho-rails'

gem 'dotenv-rails'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'

gem 'devise'
gem 'carrierwave'
gem 'cloudinary'
gem 'friendly_id', '~> 5.0'

gem 'will_paginate', '~> 3.1.0'
gem 'public_activity'

gem 'acts_as_votable', '~> 0.10.0'
gem 'acts_as_commentable'
gem 'acts_as_follower'
gem 'counter_culture', '~> 0.1.33'

gem 'faker'
gem 'populator'
gem 'auto_html', '~>1.6.4'
gem 'sanitize'

gem 'rails_admin', '~> 1.1.1'

gem 'puma'
gem 'sendinblue'
gem 'file_validators'
gem 'figaro'
gem 'ratyrate'

# Might not be needed
gem 'erubis', '~> 2.7'

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'pry'
  gem 'pry-rails'

  # Deployment
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-rbenv',   require: false
end

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'guard'
  gem 'guard-rspec', '~> 4.2.8'
end

group :production do
  gem 'rails_12factor'
	gem 'aws-sdk', '~> 2.3.0'
end
