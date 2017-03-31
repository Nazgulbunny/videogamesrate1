source 'https://rubygems.org'
ruby '2.3.1'

gem 'dotenv-rails', groups: [:development, :test]

gem 'rails', '4.2.5'
gem 'sass-rails', '~> 5.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'pg'
gem 'jquery-atwho-rails'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'

gem 'devise'
gem 'carrierwave'
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

gem 'activeadmin', github: 'activeadmin'

gem 'sidekiq'
gem 'sidetiq', github: 'sfroehler/sidetiq', branch: 'celluloid-0-17-compatibility'
gem 'pubnub',  github: 'pubnub/ruby', branch: 'celluloid'
gem 'sinatra', :require => nil
gem 'paperclip'
gem 'simple_form'

# gem "celluloid", git: "https://github.com/celluloid/celluloid", submodules: true

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'pry'
  gem 'pry-rails'
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
  gem 'unicorn'
  gem 'rails_12factor'
  gem 'fog'
  gem 'fog-aws'
	gem 'aws-sdk', '~> 2.3.0'
end
