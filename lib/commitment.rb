require "commitment/version"
require 'json'

module Commitment
  module_function
  def config
    @config ||= Config.new
  end

  class Config
    attr_reader :rubocop_config
    attr_reader :brakeman_output_pathname
    attr_reader :jshint_pattern
    attr_reader :jshint_exclude_pattern
    attr_reader :jshint_options
    attr_reader :scss_lint_config
    attr_accessor :percentage_coverage_goal
    attr_reader :code_coverage_last_run_pathname

    def initialize
      @project_pathname = default_project_pathname
      @rubocop_config = project_pathname.join('.hound.yml').to_s
      @brakeman_output_pathname = project_pathname.join('.tmp.brakeman.json')
      @jshint_pattern = 'app/assets/**/*.js'
      @jshint_exclude_pattern = 'app/assets/javascripts/vendor/*.js'
      @jshint_options = JSON.parse(project_pathname.join('.jshintrc').read)
      @scss_lint_config = project_pathname.join('.scss_lint.yml').to_s
      @percentage_coverage_goal = 100
      @code_coverage_last_run_pathname = project_pathname.join('coverage/.last_run.json')
    end

    def code_coverage_last_run_results
      if code_coverage_last_run_pathname.exist?
        JSON.parse(code_coverage_last_run_pathname.read)
      else
        abort("Commitment Failure: Unable to find code coverage information in `#{code_coverage_last_run_pathname.to_s}'")
      end
    end

    private

    attr_reader :project_pathname

    def default_project_pathname
      if ENV.key?('PROJECT_PATHNAME')
        require 'pathname'
        Pathname.new(ENV['PROJECT_PATHNAME'])
      elsif defined?(Rails)
        Rails.root
      else
        require 'pathname'
        Pathname.new(File.expand_path('../commitment/generators/templates', __FILE__))
      end
    end
  end
  private_constant :Config
end

require 'commitment/railtie' if defined?(Rails)
