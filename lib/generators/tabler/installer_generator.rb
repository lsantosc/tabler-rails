# frozen_string_literal: true

module Tabler
  ##
  # This generator will gonna install tabler needed packages
  class InstallerGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('templates', __dir__)
    PACKAGES = %w[@tabler/core tom-select].freeze

    def add_yarn_packages
      say 'Installing tabler.io needed packages'
      run "yarn add #{PACKAGES.join(' ')}"
    end
  end
end
