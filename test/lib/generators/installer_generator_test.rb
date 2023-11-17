# frozen_string_literal: true

require 'test_helper'
require 'generators/tabler/installer_generator'

class InstallerGeneratorTest < Rails::Generators::TestCase
  include DummyTestHelpers
  include TablerAssertions

  tests Tabler::InstallerGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  test 'Ensure node version' do
    start_test!
    assert_nothing_raised { run_generator }
    assert_file yarn_lock
    end_test!
  end

  test 'Do not start with wrong node version' do
    cd Rails.root
    copy_file wrong_package_template, package_json

    run_generator

    assert_no_file yarn_lock

    remove_file(package_json, true)
  end

  test 'Add yarn packages' do
    start_test!
    run_generator

    assert_file package_json
    assert_file yarn_lock

    package_content = JSON.parse(package_json.read)

    Tabler::InstallerGenerator::PACKAGES.each do |package|
      assert_includes package_content['dependencies'].keys, package
    end

    assert_contains Tabler::InstallerGenerator::JS_LINES, application_js.read
    assert_contains Tabler::InstallerGenerator::CSS_LINES, application_css.read

    end_test!
  end

  private

  def start_test!
    cd Rails.root
    copy_file package_template, package_json
  end

  def remove_packages!
    remove_file(package_json, true)
    remove_file(yarn_lock, true)
    remove_dir(Rails.root.join('node_modules'))
  end

  def return_with_templates!
    remove_file(application_js)
    copy_file(Rails.root.join('app/javascript/application_template.js'), application_js)
    remove_file(application_css)
    copy_file(Rails.root.join('app/assets/stylesheets/application_template.css'), application_css)
  end

  def end_test!
    remove_packages!
    return_with_templates!
  end
end
