require 'spec_helper'

describe AutoTagVersion do
  subject do
    AutoTagVersion
  end

  module Rails; def self.application; end; end
  module APP; end;

  let(:tag_version) { "#{rand(9)}.#{rand(9)}.#{rand(9)}" }
  let(:app) { APP }
  let(:app_version_file) { "config/initializers/app_version.rb" }

  before do
    allow(Rails).to receive_message_chain("application.class.parent_name").and_return(app.to_s)
  end

  after do
    FileUtils.rm(app_version_file)
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
      let(:git_msg) { "git add #{app_version_file} && git commit -m \"Bumping version #{tag_version}\" && git tag #{tag_version}" }

      it "should run the correct git command" do
        expect(subject).to receive(:`).with(git_msg)
        subject.tag!(tag_version)
      end
    end
  end
end
