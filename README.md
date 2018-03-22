# Auto Tag Version [![Gem Version](https://badge.fury.io/rb/auto_tag_version.svg)](http://badge.fury.io/rb/auto_tag_version) [![Code Climate](https://codeclimate.com/github/rafaelbiriba/auto_tag_version/badges/gpa.svg)](https://codeclimate.com/github/rafaelbiriba/auto_tag_version) [![Travis](https://api.travis-ci.org/rafaelbiriba/auto_tag_version.svg?branch=master)](https://travis-ci.org/rafaelbiriba/auto_tag_version) [![Coverage Status](https://coveralls.io/repos/rafaelbiriba/auto_tag_version/badge.svg?branch=master&service=github)](https://coveralls.io/github/rafaelbiriba/auto_tag_version?branch=master)

Create/Update the application version file of your Rails app and automatically create the git tag.

## Prerequisite

  - Rails application
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

And the file will be automatically commited and the git tag created. **(You need to push it manually!)**

You can access the version number of your application using **"TestAPP::VERSION"**

## Contributing

First of all, **thank you** for wanting to help!

1. [Fork it](https://help.github.com/articles/fork-a-repo).
2. Create a feature branch - `git checkout -b more_magic`
3. Add tests and make your changes
4. Check if tests are ok - `rake spec`
5. Commit changes - `git commit -am "Added more magic"`
6. Push to Github - `git push origin more_magic`
7. Send a [pull request](https://help.github.com/articles/using-pull-requests)! :heart:
