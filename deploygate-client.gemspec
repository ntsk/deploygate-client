lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "deploygate/client/version"

Gem::Specification.new do |spec|
  spec.name          = "deploygate-client"
  spec.version       = Deploygate::Client::VERSION
  spec.authors       = ["ntsk"]
  spec.email         = ["ridha.h2a26@gmail.com"]

  spec.summary       = "DeployGate API library for Ruby"
  spec.description   = "DeployGate API library for Ruby"
  spec.homepage      = "https://github.com/ntsk/deploygate-client"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'faraday'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
