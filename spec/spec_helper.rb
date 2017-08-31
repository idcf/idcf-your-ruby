# frozen_string_literal: true

require 'bundler/setup'
require 'yaml'
require 'faraday'
require 'faraday_middleware'
require 'idcf/your'

require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def stubs
  Faraday.new do |faraday|
    faraday.request :json
    faraday.response :json
    faraday.adapter :test, Faraday::Adapter::Test::Stubs.new do |stub|
      create_stub stub
    end
  end
end

private

def create_stub(stub)
  yamls = Dir.glob("./spec/idcf/factories/**/*.yml")
  yamls.each do |yaml|
    stub.get(yaml.gsub(%r{./spec/idcf/factories/(.*).yml}, '/api/v1/\1')) do
      File.open(yaml) do |file|
        data = YAML.load_stream file
        [data[0]['status'], data[0]['header'], data[1]]
      end
    end
  end
end
