# frozen_string_literal: true

module DummyTestHelpers
  def package_template
    Rails.root.join('package_template.json')
  end

  def package_json
    Rails.root.join('package.json')
  end

  def yarn_lock
    Rails.root.join('yarn.lock')
  end

  def application_js
    Rails.root.join('app/javascript/application.js')
  end

  def application_css
    Rails.root.join('app/assets/stylesheets/application.css')
  end
end
