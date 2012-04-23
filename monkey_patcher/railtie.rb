class MonkeyPatcher < Rails::Railtie
  initializer 'monkey_patcher' do
    require 'monkey_patcher.rb'
  end
end