class DbAssetsManager < Rails::Railtie
  rake_tasks do
    load 'db_assets.rake'
  end

  initializer 'db_assets_manager.postgres_fix' do
    require 'mp_postgresql_adapter.rb'
  end
end
