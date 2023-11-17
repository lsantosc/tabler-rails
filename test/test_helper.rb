# frozen_string_literal: true

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require_relative '../test/dummy/config/environment'
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../test/dummy/db/migrate', __dir__)]
require 'rails/test_help'

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  fixture_test_path = File.expand_path('fixtures', __dir__)
  ActiveSupport::TestCase.fixture_paths << fixture_test_path
  ActionDispatch::IntegrationTest.fixture_paths << fixture_test_path
  ActiveSupport::TestCase.file_fixture_path = "#{fixture_test_path}/files"
  ActiveSupport::TestCase.fixtures :all
end

Dir["#{__dir__}/support/**/*.rb"].each do |file|
  require file
end
