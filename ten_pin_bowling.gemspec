Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name              = 'ten_pin_bowling'
  s.version           = '0.1'
  s.date              = '2013-07-09'

  ## Make sure your summary is short. The description may be as long
  ## as you like.
  s.summary     = "Ten Pin Bowling implementation"
  s.description = "Small library to use as implementation for Ten Pin Bowling."

  ## List the primary authors. If there are a bunch of authors, it's probably
  ## better to set the email to an email list or something. If you don't have
  ## a custom homepage, consider using your GitHub URL or the like.
  s.authors  = ["Marc Grimme"]
  s.email    = 'marc.grimme@googlemail.com'
  s.homepage = 'https://github.com/grimme-atix-de/TenPinBowling.git'

  ## This sections is only necessary if you have C extensions.
  # s.require_paths << 'ext'
  # s.extensions = %w[ext/extconf.rb]

  ## This gets added to the $LOAD_PATH so that 'lib/NAME.rb' can be required as
  ## require 'NAME.rb' or'/lib/NAME/file.rb' can be as require 'NAME/file.rb'
  s.require_paths = %w[lib]

  ## If your gem includes any executables, list them here.
  s.executables = ["ten_pin_bowling"]

  ## Specify any RDoc options here. You'll want to add your README and
  ## LICENSE files to the extra_rdoc_files list.
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md]

  ## List your runtime dependencies here. Runtime dependencies are those
  ## that are needed for an end user to actually USE your code.
  s.add_development_dependency('rspec')
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec,tests}/*`.split("\n")
end
