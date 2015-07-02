module Commitment
  class InstallGenerator < Rails::Generators::Base
    source_root(File.expand_path("../templates", __FILE__))

    def create_jshint_options
      template('.jshintrc', '.jshintrc')
    end

    def create_hound_options
      template('.hound.yml', '.hound.yml')
    end

    def create_scss_lint
      template('.scss_lint.yml', '.scss_lint.yml')
    end

    def create_coverage_helper
      # Putting this file in the root directory of the project
      template('coverage_helper.rb', "#{test_framework}/coverage_helper.rb")
    end

    def build_default_rake_task
      append_file('Rakefile') do %(
# BEGIN `commitment:install` generator
# This was added via commitment:install generator. You are free to change this.
Rake::Task["default"].clear
task(
  default: [
    'commitment:rubocop',
    'commitment:jshint',
    'commitment:scss_lint',
    'commitment:configure_test_for_code_coverage',
    '#{test_framework}',
    'commitment:code_coverage',
    'commitment:brakeman'
  ]
)
# END `commitment:install` generator
)
      end
    end

    def inject_spec_helper
      prepend_file("#{test_framework}/#{test_framework}_helper.rb", "require 'coverage_helper'\n")
    end

    private

    def test_framework
      return 'spec' if Rails.configuration.generators.options.fetch(:rails).fetch(:test_framework) == :rspec
      'test'
    rescue NoMethodError, KeyError
      'test'
    end
  end
end
