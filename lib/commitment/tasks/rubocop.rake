namespace :commitment do
  require 'rubocop/rake_task'
  # Why hound? Because hound-ci assumes this file, and perhaps you'll be using this
  RuboCop::RakeTask.new do |t|
    t.options << "--config=#{Commitment.config.rubocop_config}"
  end
end
