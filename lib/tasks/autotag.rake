desc "Create/Update the APP VERSION and create the git tag. USAGE: rake autotag TAG=0.0.0"
task :autotag do
  app = Rails.application.class.parent_name
  tag = ENV["TAG"]
  file = File.join("config", "initializers", "app_version.rb")
  content = "module #{app}; VERSION = '#{tag}'; end\n# This file is created automatically by auto_tag_version gem"
  File.open(file, "w") { |f| f.write(content) }
  `git add #{file} && git commit -m "Bumping version #{tag}" && git tag #{tag}`
end
