class StripNumberFields < Rails::Railtie
  initializer 'strip_number_fields' do

    module ActiveRecord::AttributeMethods::Write
      private
      def convert_number_column_value(value)
        if value == false
          0
        elsif value == true
          1
        elsif value.is_a?(String)
          if value.blank?
            nil
          else
            value.gsub(/[,\s]+/, '')
          end
        else
          value
        end
      end
    end

  end
end