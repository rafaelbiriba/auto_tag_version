require 'auto_tag_version'
require 'rails'

module AutoTagVersion
  class Railtie < Rails::Railtie
    railtie_name :autotag

    rake_tasks do
      load 'tasks/autotag.rake'
    end
  end
end
