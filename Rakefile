require "bundler/gem_tasks"

desc "Run RSpec code examples"
task :spec do 
    sh "rspec -Ilib -Ispec spec/examen_spec.rb"
end

desc "Run RSpec code examples with documentation"
task :doc do 
    sh "rspec -Ilib -Ispec spec/examen_spec.rb --format documentation"
end

desc "Run RSpec code examples with html"
task :html do 
    sh "rspec -Ilib -Ispec spec/examen_spec.rb --format html"
end