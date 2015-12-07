desc "Create/Update the APP VERSION and create the git tag. USAGE: rake autotag TAG=0.0.0"
task :autotag do
  if ENV["TAG"].blank?
    puts "TAG not found! USAGE: rake autotag TAG=0.0.0"
  else
    AutoTagVersion.tag ENV["TAG"]
    AutoTagVersion.create_version_file
    AutoTagVersion.commit_and_create_tag
  end
end
