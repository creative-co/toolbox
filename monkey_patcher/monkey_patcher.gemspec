Gem::Specification.new do |s|
  s.name        = 'monkey_patcher'
  s.version     = '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Ivan Efremov'
  s.email       = 'st8998@hotmail.com'
  s.summary     = 'Tool for monkey patches on rails 3.2'
  s.description = ''

  s.files         = %w[ railtie.rb monkey_patcher.rb ]
  s.require_path  = 'railtie.rb'
end