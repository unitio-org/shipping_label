require 'bundler/setup'
require 'shipping_label'
require 'active_support/all'
require 'email_spec'
require 'pry'

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.view_paths = File.join(File.dirname(__FILE__), 'support', 'views')

RSpec.configure do |config|
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
end
