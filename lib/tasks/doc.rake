desc "Generate YARD"
task :doc do
  sh "yardoc --no-private --protected lib/**/*.rb - README.md LICENSE *.gemspec Rakefile Gemfile Gemfile.lock test/**/*"
end