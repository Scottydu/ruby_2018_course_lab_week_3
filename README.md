# README
## Ruby on rails course week 3 example

### How did I start this project?
*PREPARATIONS:* Create `.ruby-gemset`, `.ruby-version`, reload the folder `cd .` to create the gemset environment and run `gem install rails`
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
8. Add `rubocop`, `simplecov`, `factory_bot_rails`, `pry` and `faker` to the `Gemfile` and run `bundle`
```ruby
  group :development, :test do
    gem 'factory_bot_rails'
    gem 'pry'
    gem 'faker'
  end
  group :development do
    gem 'rubocop', '~> 0.59.0', require: false # Check version at the moment
  end
  group :test do
    gem 'simplecov'
  end
```
  * Add the following code to `spec/rails_helper.rb` file
  ```ruby
    require 'factory_bot'
    require 'simplecov'
    SimpleCov.start 'rails'


    RSpec.configure do |config|
      # other stuff inside
      config.include FactoryBot::Syntax::Methods # This allows you to call `create` instead of `FactoryBot.create` in the tests
    end
  ```
  * And the following code to `features/support/env.rb`
  ```ruby
    require 'factory_bot'
    World(FactoryBot::Syntax::Methods) # This allows you to call `create` instead of `FactoryBot.create` in the cucumber steps
  ```
