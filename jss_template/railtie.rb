require 'rails/railtie'

module Jss
  module Rails
    class Railtie < ::Rails::Railtie
      before_initialize do
        Sprockets.register_engine '.jss', Jss::Template
      end
    end
  end
end
