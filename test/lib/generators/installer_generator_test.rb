# frozen_string_literal: true

require 'test_helper'
require 'generators/tabler/installer_generator'

class InstallerGeneratorTest < Rails::Generators::TestCase
  tests Tabler::InstallerGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  test 'Add yarn packages' do
    cd Rails.root
    create_package!

    assert_nothing_raised do
      run_generator ['tabler:installer']
    end

    assert_file package_json
    assert_file yarn_lock

    package_content = JSON.parse(package_json.read)

    Tabler::InstallerGenerator::PACKAGES.each do |package|
      assert_includes package_content['dependencies'].keys, package
    end

    clean_files!
  end

  private

  def package_template
    Rails.root.join('package_template.json')
  end

  def package_json
    Rails.root.join('package.json')
  end

  def yarn_lock
    Rails.root.join('yarn.lock')
  end

  def create_package!
    copy_file package_template, package_json
  end

  def clean_files!
    remove_file(package_json, true)
    remove_file(yarn_lock, true)
    remove_dir(Rails.root.join('node_modules'))
  end
end
