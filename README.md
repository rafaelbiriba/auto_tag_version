# Auto Tag Version
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
