desc "Create/Update the APP VERSION and create the git tag. USAGE: rake autotag TAG=0.0.0"
task :autotag do
  tag = ENV["TAG"]
  if !defined?(Rails)
    puts "Rails app not found!"
  elsif tag.blank?
    puts "TAG not found! USAGE: rake autotag TAG=0.0.0"
  else
    puts "Creating #{tag} tag..."
    AutoTagVersion.tag!(tag)
    AutoTagVersion.print_last_tag_information
  end
end
