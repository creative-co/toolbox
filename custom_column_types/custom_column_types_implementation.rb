module SetColumnType
  extend ActiveSupport::Concern

  included do
    class_attribute :custom_column_definitions

    def self.set_column_type name, type
      raise "Definition for column '#{name}' already exists" if (columns_hash rescue {})[name.to_s].present?
      (self.custom_column_definitions ||= {})[name.to_s] = ActiveRecord::ConnectionAdapters::Column.new name, nil, type
    end

    def column_for_attribute_with_custom_definitions(name)
      (self.custom_column_definitions ||= {})[name.to_s] || column_for_attribute_without_custom_definitions(name)
      end
    alias_method_chain :column_for_attribute, :custom_definitions
  end
end

ActiveRecord::Base.send :include, SetColumnType