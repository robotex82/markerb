require "test_helper"

class Notifier < ActionMailer::Base
  self.view_paths = File.expand_path("../views", __FILE__)

  layout false

  def contact(recipient)
    @recipient = recipient
    mail(:to => @recipient, :from => "john.doe@example.com") do |format|
      format.text
      format.html
    end
  end
end

class MarkerbTest < ActiveSupport::TestCase
  test 'dual template with .merb' do
    email = Notifier.contact("you@example.com")
    assert_equal 2, email.parts.size
    assert_equal "multipart/alternative", email.mime_type
    assert_equal "text/plain", email.parts[0].mime_type
    assert_equal "Dual templates **rocks**!",
      email.parts[0].body.encoded.strip
    assert_equal "text/html", email.parts[1].mime_type
    assert_equal "<p>Dual templates <strong>rocks</strong>!</p>",
      email.parts[1].body.encoded.strip
  end
end