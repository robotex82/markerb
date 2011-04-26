require "rubygems"
require "bundler"
Bundler.setup

require "test/unit"
require "active_support/test_case"

require "action_mailer"
require "rails/railtie"
require "rails/generators"
require "rails/generators/test_case"

$:.unshift File.expand_path("../../lib", __FILE__)
require "markerb"

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
