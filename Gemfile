source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# wsdl stuff
gem 'savon', '~> 2.12.0'
gem 'wash_out'

# Gem to use tables
gem 'daru-view', git: 'https://github.com/SciRuby/daru-view'
gem "daru", git: 'https://github.com/SciRuby/daru.git'
gem "nyaplot", git: 'https://github.com/SciRuby/nyaplot.git'
gem 'google_visualr', git: 'https://github.com/winston/google_visualr.git'
gem 'daru-data_tables', git: 'https://github.com/Shekharrajak/daru-data_tables.git'

gem 'jquery-rails'

gem 'jquery-datatables'

# Access control
gem 'devise'
gem 'devise_invitable', '~> 2.0.0'

# Bootstrap
gem 'bootstrap', '~>4.0.0'

#Email styles
gem 'premailer-rails', '~> 1.10.2'

gem 'rswag'

# envs
gem 'figaro'

gem 'rspec-rails', '~> 3.8'

gem 'sendinblue'

gem "timecop"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 4.11.1'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'pry-rails', '~> 0.3.9'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 4.0.1'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
  gem 'rails-controller-testing', '~> 1.0.4'
  gem 'database_cleaner', '~> 1.7.0'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
