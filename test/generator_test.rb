require "test_helper"
require "generators/markerb/mailer/mailer_generator"

class GeneratorTest < Rails::Generators::TestCase
  tests Markerb::Generators::MailerGenerator
  destination File.expand_path("../tmp", __FILE__)
  setup :prepare_destination

  test "assert all views are properly created with given name" do
    run_generator %w(notifier foo bar baz)

    assert_file "app/views/notifier/foo.markerb"
    assert_file "app/views/notifier/bar.markerb"
    assert_file "app/views/notifier/baz.markerb"
  end
end