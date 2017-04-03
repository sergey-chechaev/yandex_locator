# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yandex_locator/version'

Gem::Specification.new do |spec|
  spec.name          = "yandex_locator"
  spec.version       = YandexLocator::VERSION
  spec.authors       = ["Sergey Chechaev"]
  spec.email         = ["kompotdrinker@gmail.com"]

  spec.summary       = %q{ruby gem for yandex locator}
  spec.description   = %q{ruby gem for yandex locator}
  spec.homepage      = "https://github.com/sergey-chechaev/yandex_locator.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_runtime_dependency 'faraday', '~> 0.11.0'

end
