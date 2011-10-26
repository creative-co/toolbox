require 'tilt'

module Jss
  class Template < Tilt::Template
    include ActionView::Helpers::JavaScriptHelper
    
    def self.default_mime_type
      'application/javascript'
    end
  
    def prepare; end
  
    def evaluate scope, _
      <<-JS
(this.JSS || (this.JSS = {}))[#{scope.logical_path.inspect}] = "#{escape_javascript(data.strip)}";
      JS
    end
  end
end

Tilt.register Jss::Template, 'jss'

require 'railtie' if defined?(Rails)