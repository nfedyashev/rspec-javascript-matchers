require 'rspec-javascript-matchers'

Dir[File.expand_path('../../spec/support/**/*.rb', __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end