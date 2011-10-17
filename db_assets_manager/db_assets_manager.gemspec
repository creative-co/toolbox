Gem::Specification.new do |s|
  s.name        = 'db_asset_manager'
  s.version     = '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Ivan Efremov'
  s.email       = 'st8998@hotmail.com'
  s.summary     = 'DB assets manager'
  s.description = 'DB assets manager'

  s.files         = ['db_assets.rake', 'db_assets_manager.rb', 'mp_postgresql_adapter.rb']
  s.require_path  = '.'
end