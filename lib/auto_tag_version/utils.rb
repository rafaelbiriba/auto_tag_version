module AutoTagVersion
  class << self
    def tag!(tag)
      @tag = tag
      create_version_file
      commit_and_create_tag
    end

    def print_last_tag_information
      if last_git_tag == tag
        puts "Everything OK! Last git tag created: #{last_git_tag}"
      else
        puts "Something goes wrong with the tag creation. Check your git log."
      end
    end

    private
    attr_reader :tag

    def content
      content = "module #{app}; VERSION = '#{tag}'; end\n\n"
      content += "# This file was created automatically by auto_tag_version gem\n"
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

    def last_git_tag
      `git describe --abbrev=0 --tags`.strip
    end
  end
end
