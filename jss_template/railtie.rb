require 'rails/railtie'

module Jss
  module Rails
    class Railtie < ::Rails::Railtie
      config.before_initialize do
        Sprockets::Engines # force loading
        Sprockets.register_engine '.jss', Jss::Template
      end
    end
  end
end
