require "test_helper"

class Notifier < ActionMailer::Base
  self.view_paths = File.expand_path("../views", __FILE__)

  layout false

  def contact(recipient, format_type)
    @recipient = recipient
    mail(:to => @recipient, :from => "john.doe@example.com") do |format|
      format.send(format_type)
    end
  end

  def multiple_format_contact(recipient)
    @recipient = recipient
    mail(:to => @recipient, :from => "john.doe@example.com", :template => "contact") do |format|
      format.text  { render 'contact' }
      format.html  { render 'contact' }
    end
  end
end

class MarkerbTest < ActiveSupport::TestCase

  test "plain text should be sent as a plain text" do
    email = Notifier.contact("you@example.com", :text)
    assert_equal "text/plain", email.mime_type
    assert_equal "Dual templates **rocks**!", email.body.encoded.strip
  end

  test "html should be sent as html" do
    email = Notifier.contact("you@example.com", :html)
    assert_equal "text/html", email.mime_type
    assert_equal "<p>Dual templates <strong>rocks</strong>!</p>", email.body.encoded.strip
  end

  test 'dealing with multipart e-mails' do
    email = Notifier.multiple_format_contact("you@example.com")
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