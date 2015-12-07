require 'spec_helper'

describe AutoTagVersion do
  subject do
      AutoTagVersion
    end

  describe ".tag" do
    it "should save and return the tag" do
      subject.tag 123
      expect(subject.tag).to be 123
    end
  end


  describe ".content" do
    before do
      allow(subject).to receive(:app).and_return("App")
      allow(subject).to receive(:tag).and_return("1.1.1")
    end

    it "should create the content for version file" do
      expect(subject.content).to eql "module App; VERSION = '1.1.1'; end\n# This file is created automatically by auto_tag_version gem\n# Documentation at https://github.com/rafaelbiriba/auto_tag_version"
    end
  end

  describe ".app" do
    module Rails; def self.application; end; end

    let :app do
      "APP"
    end

    before do
      allow(Rails).to receive_message_chain("application.class.parent_name").and_return(app)
    end

    it "should return the Rails app name" do
      expect(subject.app).to eql app
    end
  end

  describe ".version_file" do
    it "should return the version filepath" do
      expect(subject.version_file).to eql "config/initializers/app_version.rb"
    end
  end

  describe ".create_version_file" do
    let :file do
      "spec_test_file"
    end

    before do
      allow(subject).to receive(:version_file).and_return(file)
      allow(subject).to receive(:content).and_return("test")
    end

    after do
      FileUtils.rm file
    end

    it "should create the version file" do
      subject.create_version_file
      expect(`cat #{file}`).to eql "test"
    end
  end

  describe ".commit_and_create_tag" do
    before do
      allow(subject).to receive(:version_file).and_return("test")
      allow(subject).to receive(:tag).and_return("1.2.3")
    end

    it "should commit and create the git tag" do
      git_msg = "git add test && git commit -m \"Bumping version 1.2.3\" && git tag 1.2.3"
      expect(subject).to receive(:`).with(git_msg)
      subject.commit_and_create_tag
    end
  end
end
