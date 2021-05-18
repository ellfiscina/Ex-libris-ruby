source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'bundler', '>= 1.8.4'
gem 'rails-i18n'
gem 'devise', '~> 4.5'
gem 'devise-i18n'
gem 'kaminari'
gem 'kaminari-i18n'
gem 'gon'
gem 'multi-select-rails'
gem 'd3-tip-rails', '~> 0.0.1'
gem "aws-sdk-s3", require: false
gem 'bootstrap_progressbar', '~> 0.2.0'
gem 'image_processing', '~> 1.2'
gem 'font-awesome-rails', '~> 4.7'
gem 'bootstrap', '~> 4.1', '>= 4.1.3'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'bootstrap_sb_admin_base_v2'
gem 'acts_as_list'
gem 'html5sortable-rails', '~> 0.9.3.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap.growl'
  gem 'rails-assets-animate-css'
  gem 'rails-assets-d3'
end

gem 'pg'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant

gem 'mini_magick', '~> 4.8'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails-erd'
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'better_errors', '~> 2.4'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
