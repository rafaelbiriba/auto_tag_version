desc "Create/Update the APP VERSION and create the git tag. USAGE: rake autotag TAG=0.0.0"
task :autotag do
  if !defined?(Rails)
    puts "Rails app not found!"
  elsif ENV["TAG"].blank?
    puts "TAG not found! USAGE: rake autotag TAG=0.0.0"
  else
    AutoTagVersion.tag!(ENV["TAG"])
  end
end
