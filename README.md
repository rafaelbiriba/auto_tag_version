# Auto Tag Version [![Gem Version](https://badge.fury.io/rb/auto_tag_version.svg)](http://badge.fury.io/rb/auto_tag_version) [![Code Climate](https://codeclimate.com/github/rafaelbiriba/auto_tag_version/badges/gpa.svg)](https://codeclimate.com/github/rafaelbiriba/auto_tag_version) [![Travis](https://api.travis-ci.org/rafaelbiriba/auto_tag_version.svg?branch=master)](https://travis-ci.org/rafaelbiriba/auto_tag_version) [![Coverage Status](https://coveralls.io/repos/rafaelbiriba/auto_tag_version/badge.svg?branch=master&service=github)](https://coveralls.io/github/rafaelbiriba/auto_tag_version?branch=master)

Create/Update the application version file of your Rails app and automatically create the git tag.

## Prerequisite

  - For now, only Rails application (Tested Rails 3 and 4)
  - *Gems support comming soon!*

## Installation

Add this line to your application's Gemfile:

```
  gem 'auto_tag_version'
```

When you need to create a tag:

```
  $ rake autotag TAG=10.24.5
```

## How it works

Considering you application name is "TestAPP", this code above will create a file in "test_app/config/initializers/app_version.rb" with the content like:

```
module TestAPP
  VERSION = 10.24.5
end
```
And them will commit this file and create a git tag. **(You need to push it manually!)**

You can get the version number in your application as **"TestAPP::VERSION"**
