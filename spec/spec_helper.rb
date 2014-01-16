ENV['RACK_ENV'] = 'test'

require 'sinatra'
require 'pry'
require 'rspec'
require 'rr'

RSpec.configure do |config|

  # Mock with RR
  config.mock_with :rr

  # Allow running one test at a time
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

end

