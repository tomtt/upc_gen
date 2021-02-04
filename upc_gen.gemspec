require_relative "lib/upc_gen/version"

Gem::Specification.new do |spec|
  spec.name = "upc_gen"
  spec.version = UpcGen::VERSION
  spec.authors = ["Tom ten Thij"]
  spec.email = ["code@tomtenthij.nl"]

  spec.summary = "A skeleton to start a gem from"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) {
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("ean13", "~> 2.0.2")
end
