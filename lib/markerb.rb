require "action_view/template"
require "redcarpet"
require "markerb/railtie"

module Markerb
  mattr_accessor :processing_options
  @@processing_options = []

  class Handler
    def erb_handler
      @erb_handler ||= ActionView::Template.registered_template_handler(:erb)
    end

    def call(template)
      compiled_source = erb_handler.call(template)
      if template.formats.include?(:html)
        "Redcarpet.new(begin;#{compiled_source};end, *Markerb.processing_options).to_html.html_safe"
      else
        compiled_source
      end
    end
  end
end

ActionView::Template.register_template_handler :markerb, Markerb::Handler.new
