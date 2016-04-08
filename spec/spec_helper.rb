require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'yaml'
require_relative '../models/talk.rb'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation # || :html || :progress
  config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }
end
