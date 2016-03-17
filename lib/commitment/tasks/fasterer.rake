namespace :commitment do
  desc "Check for code that can go faster"
  task :fasterer do
    require 'fasterer/file_traverser'
    file_traverser = Fasterer::FileTraverser.new(nil)
    file_traverser.traverse
    if file_traverser.offenses_found?
      $stderr.puts "You can make the code go faster, see above. You can add exceptions in .fasterer.yml"
      abort
    end
  end
end
