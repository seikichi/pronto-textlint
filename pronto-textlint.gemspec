# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pronto/textlint/version'

Gem::Specification.new do |spec|
  spec.name          = 'pronto-textlint'
  spec.version       = Pronto::Textlint::VERSION
  spec.authors       = ['Seiichi KONDO']
  spec.email         = ['seikichi@kmc.gr.jp']

  spec.summary       = 'Pronto runner for textlint.'
  spec.description   = <<-EOF
    A pronto runner for textlint - pluggable linting tool for text and markdown.
    Pronto runs analysis quickly by checking only the relevant changes.
    Created to be used on pull requests, but suited for other scenarios as well.
  EOF
  spec.homepage      = 'https://github.com/seikichi/pronto-luacheck'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'pronto', '~> 0.9.0'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rubocop', '>= 0.49.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'test-unit', '~> 3.0'
  spec.add_development_dependency 'test-unit-rr', '~> 1.0'
end
