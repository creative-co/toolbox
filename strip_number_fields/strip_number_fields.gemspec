Gem::Specification.new do |s|
  s.name        = 'strip_number_fields'
  s.version     = '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Ivan Efremov'
  s.email       = 'st8998@hotmail.com'
  s.summary     = 'Strip commas and blank space delimiters from AR number fields'
  s.description = 'Strip commas and blank space delimiters from AR number fields'

  s.add_dependency 'activerecord', '~> 3.2.1'

  s.files         = ['strip_number_fields.rb']
  s.require_path  = '.'
end