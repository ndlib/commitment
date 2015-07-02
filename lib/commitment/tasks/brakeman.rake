namespace :commitment do
  namespace :brakeman do
    task scan: [:environment] do
      $stdout.puts "Checking commitment:brakeman"
      require 'brakeman'
      Brakeman.run app_path: '.', output_files: [Commitment.config.brakeman_output_pathname.to_s], print_report: true
    end

    task(guard: [:environment, 'commitment:brakeman:scan']) do
      begin
        json_document = Commitment.config.brakeman_output_pathname.read
        json = JSON.parse(json_document)
      ensure
        Commitment.config.brakeman_output_pathname.unlink
      end
      errors = []
      ['errors', 'warnings', 'ignored_warnings'].each do |key|
        errors += Array.wrap(json.fetch(key))
      end
      if errors.any?
        abort("Brakeman Vulnerabilities Detected:\n\n\t" << errors.join("\n\t"))
      end
    end
  end

  desc 'Ensure that brakeman has not detected any vulnerabilities'
  task brakeman: ['brakeman:guard']
end
