# frozen_string_literal: true
# encoding: UTF-8

require 'rspec'
require 'rspec/matchers'

require 'v8'

RSpec::Matchers.define :be_valid_javascript do
  match do |actual|
    failure_reason(actual) == ''
  end

  def failure_reason(actual)
    cxt = V8::Context.new
    begin
      cxt.eval(actual)
      ''
    rescue V8::Error => e
      # Because <eval> doesn't provide any meaningful context info here:k:w
      # Invalid regular expression: missing / at <eval>:4:12
      e.root_cause.message.gsub('<eval>:', '')
    end
  end

  failure_message do |actual|
   failure_reason(actual)
  end
end
