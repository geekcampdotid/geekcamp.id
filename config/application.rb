require_relative 'boot'

require 'rails/all'
require 'rack/rewrite/yaml_rule_set'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Geekcamp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.middleware.insert(0, Rack::Rewrite,
        klass: Rack::Rewrite::YamlRuleSet,
        options: {
          file_name: Rails.root.join('config', 'rewrite.yml')
        }
    )
  end
end
