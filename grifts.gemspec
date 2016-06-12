# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grifts/version'

Gem::Specification.new do |spec|
  spec.name          = "grifts"
  spec.version       = Grifts::VERSION
  spec.authors       = ["gerald hernandez"]
  spec.email         = ["gerald2557@gmail.com"]

  spec.summary       = %q{A gem for scraping diablo 3 greater rift leaderboard ranks.}
  spec.description   = %q{Scrape diablo 3 leaderboard ranks.}
  spec.homepage      = "htts://github.com/monoliths/grifts"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri"
end
