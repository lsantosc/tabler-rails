# frozen_string_literal: true

require_relative 'lib/tabler/rails/version'

Gem::Specification.new do |spec|
  spec.name        = 'tabler-rails'
  spec.version     = Tabler::Rails::VERSION
  spec.authors     = ['Lucas Santos da Costa']
  spec.email       = ['lsantosc@live.com']
  spec.homepage    = 'http://github.com/lsantosc/tabler-rails'
  spec.summary     = 'Add tabler.io to your Rails application'
  spec.description = 'This gem adds tabler.io easily, with form builders, helpers and more.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = "#{spec.homepage}.git"
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 7.0.8'
  spec.add_development_dependency 'rubocop', '~> 1.57.2', '>= 1.57.2'
end
