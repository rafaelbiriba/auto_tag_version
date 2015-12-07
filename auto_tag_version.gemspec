lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'auto_tag_version/version'

Gem::Specification.new do |s|
  s.name          = "auto_tag_version"
  s.version       = AutoTagVersion::VERSION
  s.summary       = "Generate auto tag"
  s.description   = "Generate auto tag"
  s.authors       = ["Rafael Biriba"]
  s.email         = ["biribarj@gmail.com"]
  s.files         = `git ls-files -z`.split("\x0")
  s.require_paths = ["lib"]
  s.homepage      = "https://github.com/rafaelbiriba/auto_tag_version"
  s.license       = "MIT"

  s.add_dependency "railties"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "coveralls"
end
