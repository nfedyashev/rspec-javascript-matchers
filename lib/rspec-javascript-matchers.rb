# frozen_string_literal: true
# encoding: UTF-8

require 'rspec'
require 'rspec/matchers'

RSpec::Matchers.define :be_valid_javascript do
  match do |actual|
    failure_reason(actual) == ''
  end

  def failure_reason(actual)
    if defined?(V8)
      cxt = V8::Context.new
      begin
        cxt.eval(actual)
        ''
      rescue V8::Error => e
        #e.in_javascript? => true

        # this looks more like a runtime error rather than parse error
        return '' if e.root_cause.to_s.include?('is not defined')

        # Because <eval> doesn't provide any meaningful context info here:k:w
        # Invalid regular expression: missing / at <eval>:4:12
        e.root_cause.message.gsub('<eval>:', '') + "\nActual:\n#{actual}"
      end
    elsif defined?(MiniRacer)
      context = MiniRacer::Context.new
      begin
        context.eval(actual)
        ''
      rescue MiniRacer::ParseError => e
        # Because default is:
        # "Uncaught SyntaxError: Invalid regular expression: missing / at undefined:4:10"
        e.message.gsub('Uncaught SyntaxError: ', '').gsub(' undefined:', ' ') + "\nActual:\n#{actual}"
      rescue MiniRacer::RuntimeError => e
        # Most likely smth like: "ReferenceError: $ is not defined" which we don't care about in specs
        ''
      end
    else
      %(Maker sure you have "mini_racer" or "therubyracer" gem in your Gemfile dependencies)
    end
  end

  failure_message do |actual|
    failure_reason actual
  end
end
