module Commitment
  class Railtie < Rails::Railtie
    rake_tasks do
      require 'commitment'
      load 'commitment/tasks/brakeman.rake'
      load 'commitment/tasks/rubocop.rake'
      load 'commitment/tasks/jshint.rake'
      load 'commitment/tasks/scss_lint.rake'
      load 'commitment/tasks/code_coverage.rake'
    end

    generators do
      require 'commitment/generators/install_generator'
    end
  end
end
