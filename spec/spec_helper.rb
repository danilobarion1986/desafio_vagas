require "codeclimate-test-reporter"
require "simplecov"

SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ])
end

CodeClimate::TestReporter.start

require 'yaml'
require_relative '../models/talk.rb'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation # || :html || :progress
  config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }
end
