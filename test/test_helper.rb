ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "database_cleaner/mongoid"

module LoginHelper
  def log_in(user)
    post login_url, params: { username: user.username, password: "Password@1" }
  end

  def log_in_as(user)
    visit login_url
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Log In"
  end
end

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

     # include login helper
     include LoginHelper

     # Add more helper methods to be used by all tests here...
     # Setup DatabaseCleaner
     DatabaseCleaner.strategy = :deletion # Use deletion for Mongoid

     setup do
       DatabaseCleaner.start
     end

     teardown do
       DatabaseCleaner.clean
     end
  end
end
