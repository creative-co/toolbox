Gem::Specification.new do |s|
  s.name        = 'jss_template'
  s.version     = '1.1.1'
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Ilia Ablamonov'
  s.email       = 'ilia@flamefork.ru'
  s.summary     = 'HTMLs to JS object template with no processing'
  s.description = 'HTMLs to JS object template with no processing'

  s.files         = ['jss_template.rb', 'railtie.rb']
  s.require_path  = '.'
  
  s.add_dependency 'tilt'
end