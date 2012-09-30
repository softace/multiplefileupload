# -*- ruby -*-
source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'utf8_enforcer_workaround', '1.0.1'
gem "pg", "0.14.1"
gem "validates_timeliness", "~> 3.0"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'rack-google_analytics', '1.0.2', :require => "rack/google_analytics"
end


gem "rspec-rails", "~> 2.11", :group => [:development, :test]

group :development do
  gem 'debugger'
end

group :test do
  gem 'debugger' ##necessary for debugging cucumber
  gem "cucumber-rails", "~> 1.3", :require => false
  gem "database_cleaner", "~> 0.8"
  gem "shoulda-matchers", "~> 1.3"
  gem "factory_girl_rails", "~> 4.0"
#  gem "capybara", "~> 1.1"
  gem "capybara", :git => "git://github.com/jnicklas/capybara.git"
  gem "xpath", :git => "git://github.com/jnicklas/xpath.git"
end

