lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'npb_headline/version'

Gem::Specification.new do |spec|
  spec.name          = 'npb_headline'
  spec.version       = NpbHeadline::VERSION
  spec.authors       = ['kami']
  spec.email         = ['kami30k@gmail.com']
  spec.summary       = %q{NpbHeadline show the headlines of NPB (Nihon Professional Baseball) based on Y's Sports on command line.}
  spec.description   = %q{NpbHeadline show the headlines of NPB (Nihon Professional Baseball) based on Y's Sports on command line.}
  spec.homepage      = 'https://github.com/kami30k/npb_headline'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
