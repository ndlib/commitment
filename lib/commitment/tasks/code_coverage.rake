namespace :commitment do
  task :configure_test_for_code_coverage do
    ENV['COVERAGE'] = 'true'
  end
  task :code_coverage do
    $stdout.puts "Checking commitment:code_coverage"
    coverage_percentage = Commitment.config.code_coverage_last_run_results.fetch('result').fetch('covered_percent').to_i
    if Commitment.config.percentage_coverage_goal > coverage_percentage
      abort("Code Coverage Goal Not Met:\n\t#{Commitment.config.percentage_coverage_goal}%\tExpected\n\t#{coverage_percentage}%\tActual")
    end
  end
end
