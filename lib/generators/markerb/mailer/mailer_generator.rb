require "rails/generators/erb/mailer/mailer_generator"

module Markerb
  module Generators
    class MailerGenerator < Erb::Generators::MailerGenerator
      source_root File.expand_path("../templates", __FILE__)

      protected

      def format
        nil # Our templates have no format
      end

      def handler
        :markerb
      end
    end
  end
end