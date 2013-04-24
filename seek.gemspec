require File.expand_path('../lib/seek/version', __FILE__)

Gem::Specification.new do |spec|

  spec.authors      = %w{ bukowskis }
  spec.summary      = "A sanitizer for pagination and sorting options."
  spec.description  = "A sanitizer for pagination and sorting options. It is supposed to help unify passing search options via cross-application APIs."
  spec.homepage     = 'https://github.com/bukowskis/seek'
  spec.license      = 'MIT'

  spec.name         = 'seek'
  spec.version      = Seek::VERSION::STRING

  spec.files        = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
  spec.require_path = 'lib'

  spec.rdoc_options.concat ['--encoding',  'UTF-8']

  spec.add_dependency('positify', '~> 0.0.1')

  spec.add_development_dependency('rspec')
  spec.add_development_dependency('guard-rspec')
  spec.add_development_dependency('rb-fsevent')

end
