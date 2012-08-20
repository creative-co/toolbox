require 'rails/railtie'

module Jss
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "jss_template", :before => "sprockets.environment" do
        require 'sprockets'
        Sprockets.register_engine '.jss', Jss::Template
      end
    end
  end
end
