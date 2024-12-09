# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner-mongoid'

# Add additional requires below this line. Rails is not loaded until this point!
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

RSpec.configure do |config|
  # Remove this line to enable support for ActiveRecord
  config.use_active_record = false

  # Configure DatabaseCleaner for MongoDB
  begin
    DatabaseCleaner.strategy = :deletion
  rescue NameError
    raise "You need to add 'database_cleaner-mongoid' to your Gemfile (in the :test group) if you wish to use it."
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:deletion) # Ensures the database is clean before running the test suite
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :deletion # Use deletion strategy for MongoDB
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/7-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  # Uncomment to run tests in random order and debug seed-based failures
  config.order = :random
  Kernel.srand config.seed
end
