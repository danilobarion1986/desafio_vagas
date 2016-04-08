require_relative '../models/talk.rb'
require 'yaml'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation # || :html || :progress
  config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }
end
