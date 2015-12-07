lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = "auto_tag_version"
  s.version       = "0.0.1"
  s.summary       = "Generate auto tag"
  s.description   = "Generate auto tag"
  s.authors       = ["Rafael Biriba"]
  s.email         = ["biribarj@gmail.com"]
  s.files         = `git ls-files -z`.split("\x0")
  s.require_paths = ["lib"]
  s.homepage      = "https://github.com/rafaelbiriba/"
  s.license       = "MIT"

  s.add_dependency "railties"
  s.add_development_dependency "rake"
end
