require 'simplecov'
SimpleCov.start 'rails' if ENV["COVERAGE"]

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!('rails')
end


ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
  require 'factory_girl_rails'
  include FactoryGirl::Syntax::Methods
  include AuthHelper
end
