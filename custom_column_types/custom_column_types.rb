class CustomColumnTypes < Rails::Railtie
  initializer 'custom_column_types' do
    require 'custom_column_types_implementation.rb'
  end
end