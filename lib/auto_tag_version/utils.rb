module AutoTagVersion
  class << self
    def tag!(tag)
      @tag = tag
      create_version_file
      commit_and_create_tag
    end

    private
    attr_reader :tag

    def content
      content = "module #{app}; VERSION = '#{tag}'; end\n"
      content += "# This file is created automatically by auto_tag_version gem\n"
      content += "# Documentation at https://github.com/rafaelbiriba/auto_tag_version"
    end

    def app
      Rails.application.class.parent_name
    end

    def version_file
      File.join("config", "initializers", "app_version.rb")
    end

    def create_version_file
      File.open(version_file, "w") { |f| f.write(content) }
    end

    def commit_and_create_tag
      `git add #{version_file} && git commit -m "Bumping version #{tag}" && git tag #{tag}`
    end
  end
end
