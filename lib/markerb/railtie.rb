module Markerb
  class Railtie < ::Rails::Railtie
    config.markerb = Markerb
    config.app_generators.mailer :template_engine => :markerb
  end
end