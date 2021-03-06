lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omcms/version"

Gem::Specification.new do |spec|
  spec.name          = "omcms-ruby-client"
  spec.version       = OMCMS::VERSION
  spec.authors       = ["Pradeep Rawat"]
  spec.email         = ["pradeep@akaruilabs.com"]

  spec.summary       = %q{A Ruby SDK for OMCMS APIs}
  spec.description   = %q{omcms-ruby-client make is simpler to use OMCMS connector APIs and integrate with existing Ruby application}
  spec.homepage      = "https://github.com/equitymultiple/omcms-ruby-client"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/equitymultiple/omcms-ruby-client"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.15"
  spec.add_dependency "faraday_middleware", "~> 0.13"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
