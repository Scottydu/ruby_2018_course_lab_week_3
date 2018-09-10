# README
## Ruby on rails course week 3 example

1. `rails new . -d=postgresql -T` -T doesn't add any test suite (default test suite for Rails is minitest - which _sucks_)
  * run `rails db:create`
2. Install [Rspec for rails](https://github.com/rspec/rspec-rails) adding to the gemfile the following code:
```ruby
  group :development, :test do
    gem 'rspec-rails'
  end
```
3. `bundle`
4. run `rails generate rspec:install`
  * This command setups everything needed to run `rspec` in your app
  * Try to run `rspec` to check it's working
5. Install [Cucumber for rails](https://github.com/cucumber/cucumber-rails)
```ruby
group :test do
  gem 'cucumber-rails', require: false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end
```
6. `bundle`
7. Run `rails generate cucumber:install`
  * This command setups everything needed to run `rails cucumber` in your app
  * Try to run `rails cucumber` to check it's working
8. Install `rubocop`, `simplecov`, `factory_bot_rails`, `pry` and `faker` and run `bundle`
```ruby
  group :development, :test do
    gem 'factory_bot_rails'
    gem 'pry'
    gem 'faker'
  end
  group :development do
    gem 'rubocop', '~> 0.59.0', require: false
  end
  group :test do
    gem 'simplecov'
  end
```
  * Add the following code to `spec/rails_helper.rb` file
  ```ruby
    require 'simplecov'
    SimpleCov.start
  ```
