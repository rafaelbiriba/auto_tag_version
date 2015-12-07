module AutoTagVersion

  def self.tag tag = nil
    @tag = @tag || tag
  end

  def self.content
    content = "module #{app}; VERSION = '#{tag}'; end\n"
    content += "# This file is created automatically by auto_tag_version gem\n"
    content += "# Documentation at https://github.com/rafaelbiriba/auto_tag_version"
  end

  def self.app
    Rails.application.class.parent_name
  end

  def self.version_file
    File.join("config", "initializers", "app_version.rb")
  end

  def self.create_version_file
    File.open(version_file, "w") { |f| f.write(content) }
  end

  def self.commit_and_create_tag
    `git add #{version_file} && git commit -m "Bumping version #{tag}" && git tag #{tag}`
  end
end
