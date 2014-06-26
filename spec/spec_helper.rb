require 'support/json_helper'
require 'rgcm'

FIXTURES_PATH = "#{File.dirname(__FILE__)}/fixtures"

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.include(JsonHelper)
end
