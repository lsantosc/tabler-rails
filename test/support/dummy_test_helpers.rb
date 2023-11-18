# frozen_string_literal: true

module DummyTestHelpers
  def application_template
    Rails.root.join('app/views/layouts/application.html.erb')
  end

  def package_template
    Rails.root.join('package_template.json')
  end

  def wrong_package_template
    Rails.root.join('package_wrong.json')
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
