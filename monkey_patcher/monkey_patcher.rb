class MonkeyPatcher < Rails::Railtie
  initializer 'monkey_patcher' do
    require 'monkey_patcher_reloader.rb'
  end
end