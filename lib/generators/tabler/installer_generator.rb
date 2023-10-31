# frozen_string_literal: true

module Tabler
  ##
  # This generator will gonna install tabler needed packages
  # and insert js and css needed lines automatically
  class InstallerGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)
    PACKAGES = %w[@tabler/core tom-select].freeze
    JS_LINES = %(\nimport "@tabler/core/dist/js/tabler.esm";\nimport "tom-select/dist/js/tom-select.complete";)
    CSS_LINES = %(\n@import "@tabler/core/dist/css/tabler.css";\n@import "tom-select/dist/css/tom-select.css";\n)

    def ensure_node_version
      version = run 'node --version', capture: true
      major_version = version.split('.').first.gsub(/\D/, '').to_i
      return say "Great! You node version is #{version}", :green if major_version >= 18

      say_error('Node version needs to be >=18', :red)
      exit!
    end

    def add_yarn_packages
      say 'Installing tabler.io needed packages', :green
      run "yarn add #{PACKAGES.join(' ')}"
    end

    def add_js_lines
      application_javascript_path = fetch_application_js_path
      create_file(application_javascript_path) unless application_javascript_path.exist?
      say "Inserting Javascript lines into #{application_javascript_path}", :green
      insert_into_file application_javascript_path.to_s, JS_LINES, after: 'import "@hotwired/turbo-rails";'
    end

    def add_css_lines
      application_css_path = fetch_application_css_path
      say "Inserting CSS lines into #{application_css_path}", :green
      append_to_file application_css_path, CSS_LINES
    end

    private

    def fetch_application_css_path
      if using_custom_frontend?
        destination.join('app/frontend/stylesheets/application.css')
      else
        destination.join('app/assets/stylesheets/application.css')
      end
    end

    def fetch_application_js_path
      if using_custom_frontend?
        destination.join('app/frontend/javascripts/application.js')
      elsif using_javascript_folder?
        destination.join('app/javascript/application.js')
      else
        say 'Yay, you are using old structure, eh?', :magenta
        destination.join('app/assets/javascripts/application.js')
      end
    end

    def destination
      Pathname(Rails.root)
    end

    def using_custom_frontend?
      destination.join('app/frontend').exist?
    end

    def using_javascript_folder?
      destination.join('app/javascript').exist?
    end
  end
end
