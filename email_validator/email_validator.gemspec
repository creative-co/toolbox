Gem::Specification.new do |s|
  s.name        = 'email_validator'
  s.version     = '1.0.3'
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Ivan Efremov'
  s.email       = 'st8998@hotmail.com'
  s.summary     = 'Email validator'
  s.description = 'Email validator'

  s.add_dependency 'mail'

  s.files         = ['email_validator.rb']
  s.require_path  = '.'
end