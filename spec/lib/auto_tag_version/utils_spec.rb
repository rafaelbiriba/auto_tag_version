require 'spec_helper'

describe AutoTagVersion do
  subject do
    AutoTagVersion
  end

  module Rails; def self.application; end; end
  module APP; end

  let(:tag_version) { "#{rand(9)}.#{rand(9)}.#{rand(9)}" }
  let(:app) { APP }
  let(:app_version_file) { "config/initializers/app_version.rb" }
  let(:git_add_cmd) { "git add #{app_version_file} && git commit -m \"Bumping version #{tag_version}\" && git tag #{tag_version}" }


  before do
    allow(Rails).to receive_message_chain("application.class.parent_name").and_return(app.to_s)
    allow(subject).to receive(:`).with(git_add_cmd)
  end

  after do
    FileUtils.rm(app_version_file) if File.exist?(app_version_file)
  end

  describe ".tag!" do
    context "VERSION variable available" do
      before do
        subject.tag!(tag_version)
        load(app_version_file)
      end

      it "should save the correct tag version" do
        expect(app::VERSION).to eq(tag_version)
      end
    end

    context "git integration" do
      it "should run the correct git command" do
        expect(subject).to receive(:`).with(git_add_cmd)
        subject.tag!(tag_version)
      end
    end
  end

  describe ".print_last_tag_information" do
    let(:git_tags_cmd) { "git describe --abbrev=0 --tags" }

    before do
      allow(subject).to receive(:`).with(git_tags_cmd).and_return(tag_version)
      subject.tag!(tag_version)
    end

    it "should print successful message" do
      expect { subject.print_last_tag_information }.to output("Everything OK! Last git tag created: #{tag_version}\n").to_stdout
    end

    it "should print successful message" do
      allow(subject).to receive(:`).with(git_tags_cmd).and_return("test.0.1")
      expect { subject.print_last_tag_information }.to output("Something goes wrong with the tag creation. Check your git log.\n").to_stdout
    end
  end
end
