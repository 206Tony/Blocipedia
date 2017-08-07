 source 'https://rubygems.org'
 
 git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
 end
 
 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
 gem 'rails', '~> 5.1.2'
 
 # #1 specify diff database for development and production environment
 group :production do
   # Use pg as the production database for Active Record
   gem 'pg'
   gem 'rails_12factor'
 end
 
 # #2 use squites3 for dev environment b/c its easy to use perfect for rapid testing.
 # Heroku only supports Postgres, so use pg in PE
 group :development do
   # Use sqlite3 as the development database for Active Record
   gem 'sqlite3'
   gem 'pry-rails'
 end
 
 # Use Puma as the app server
 gem 'puma', '~> 3.9.1'
 # Use SCSS for stylesheets
 gem 'sass-rails', '~> 5.0.6'
 # Use Uglifier as compressor for JavaScript assets
 gem 'uglifier', '>= 3.2.0'
 
 # Use jquery as the JavaScript library
 gem 'jquery-rails'
 # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
 gem 'turbolinks', '~> 5.0.1'
 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
 gem 'jbuilder', '~> 2.7.0'
 
 gem 'thor', '0.19.4'

 gem 'bootstrap-sass'

 gem 'bcrypt', '~> 3.1.7'

 gem 'figaro', '~> 1.0'

 gem 'devise'
 
 group :development do
   gem 'listen', '~> 3.1.5'
 end

# add :development, and :test groups b/c want tasks and gens to be ava. in both environments
 group :development, :test do
  gem 'rspec-rails', '~> 3.6.0'
  gem 'rails-controller-testing'
  gem 'shoulda'
  gem 'factory_girl_rails', '~> 4.8.0'
 end