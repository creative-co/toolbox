require 'rails/railtie'

module Jss
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "jss_template", :after => "sprockets.environment" do
        Sprockets::Engines # force loading
        Sprockets.register_engine '.jss', Jss::Template
      end
    end
  end
end
