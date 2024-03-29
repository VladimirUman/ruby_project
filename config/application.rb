require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Depot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    if defined?(Rack::Cache)
      config.middleware.delete(Rack::Cache)
      config.middleware.insert 0, Rack::Cache, {
        :verbose     => true, # log verbosity
        :metastore   => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/meta"), # URI encoded in case of spaces
        :entitystore => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/body")
      }
    end
  end
end
