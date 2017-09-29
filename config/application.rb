require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VideoGamesRate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.cache_store = :redis_store, ENV["REDIS_URL"]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.log_tags = [ :request_id ]

    config.lograge.enabled = true
    config.lograge.formatter = Lograge::Formatters::Logstash.new
    config.lograge.custom_options = lambda do |event|
      exceptions = %w(controller action format id)
      {
        time: event.time,
        params: event.payload[:params].except(*exceptions)
      }
    end
  end
end
