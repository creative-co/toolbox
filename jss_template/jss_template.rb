require 'tilt'

module Jss
  class Template < Tilt::Template
    include ActionView::Helpers::JavaScriptHelper
    
    def self.default_mime_type
      'application/javascript'
    end
  
    def prepare; end
  
    def evaluate scope, locals, &block
      paths = (['JSS'] + scope.logical_path.split(/[\/\\]/)).map{|s| "'#{s}'"}.join(',')
      
      <<-JS
  (function() {
      var paths = [#{paths}], target = this;
      for (var i = 0; i < paths.length - 1; i++) target = (target[paths[i]] || (target[paths[i]] = {}));
      target[paths[paths.length-1]] = "#{escape_javascript(data.strip)}";
  }).call(this);
      JS
    end
  end
end

Tilt.register Jss::Template, 'jss'

require 'jss_template/railtie' if defined?(Rails)