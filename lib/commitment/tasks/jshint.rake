namespace :commitment do
  require 'jshintrb/jshinttask'
  desc 'Ensure that javascript has been properly linted'
  Jshintrb::JshintTask.new :jshint do |t|
    t.pattern = Commitment.config.jshint_pattern
    t.exclude_pattern = Commitment.config.jshint_exclude_pattern
    t.options = Commitment.config.jshint_options
  end
end
