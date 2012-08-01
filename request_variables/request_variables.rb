module RequestVariables
  class << self
    @@_request_variables_storage = {}

    def method_missing name, val = nil
      name = name.to_s
      if name.writer?
        storage[name[0..-2]] = val
      else
        storage[name]
      end
    end

    def clear
      @@_request_variables_storage.delete(Thread.current.object_id)
    end

    private

    def storage
      @@_request_variables_storage[Thread.current.object_id] ||= {}
    end
  end

  module Support
    extend ActiveSupport::Concern

    included do
      cattr_accessor :rememberable_request_variables

      around_filter :control_request_variables
    end

    def control_request_variables
      self.class.rememberable_request_variables.each do |name|
        RequestVariables.send("#{name}=", self.send(name))
      end

      yield

    ensure
      RequestVariables.clear
    end

    module ClassMethods
      def remember_request_variables *args
        self.rememberable_request_variables = args
      end
    end
  end

end