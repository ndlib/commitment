namespace :commitment do
  require 'scss_lint/rake_task'
  desc 'Ensure that javascript has been properly linted'
  SCSSLint::RakeTask.new('scss_lint') do |t|
    t.config = Commitment.config.scss_lint_config
    t.files = [] # Rely instead on he above configuration
  end
end
