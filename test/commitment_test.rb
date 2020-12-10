require_relative 'minitest_helper'
require 'pathname'
class TestCommitment < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Commitment::VERSION
  end

  def test_it_has_a_configuration
    assert ::Commitment.config
  end

  def test_its_config_has_a_rubocop_config
    assert_kind_of String, ::Commitment.config.rubocop_config
  end

  def test_its_config_has_a_brakeman_output_pathname
    assert_kind_of Pathname, ::Commitment.config.brakeman_output_pathname
  end

  def test_its_config_has_a_jshint_pattern
    assert_kind_of String, ::Commitment.config.jshint_pattern
  end

  def test_its_config_has_a_jshint_exlude_pattern
    assert_kind_of String, ::Commitment.config.jshint_exclude_pattern
  end

  def test_its_config_has_a_jshint_options
    assert_kind_of Hash, ::Commitment.config.jshint_options
  end

  def test_its_config_has_a_scss_lint_config
    assert_kind_of String, ::Commitment.config.scss_lint_config
  end

  def test_its_config_has_a_percent_coverage_goal
    assert_kind_of Integer, ::Commitment.config.percentage_coverage_goal
  end

  def test_its_config_has_a_code_coverage_last_run_pathname
    assert_kind_of Pathname, ::Commitment.config.code_coverage_last_run_pathname
  end

  def test_it_has_code_coverage_last_run_results
    assert_respond_to ::Commitment.config, :code_coverage_last_run_results
  end
end
