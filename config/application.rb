require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
ENV['RAILS_ADMIN_THEME'] = 'softwarebrothers_theme'

module DeliveryService
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins ENV.fetch("ALLOWED_ORIGINS") { "" }.split(",")
        resource '/graphql/*',
                 headers: %w(Authorization),
                 methods: :any,
                 expose: %w(Authorization),
                 max_age: 600
        resource "*", headers: :any, methods: %i[get post options], credentials: true
      end

      if Rails.env.development?
        allow do
          origins %w[localhost:3000 localhost]
          resource '/graphql/*',
                   headers: %w(Authorization),
                   methods: :any,
                   expose: %w(Authorization),
                   max_age: 600
          resource "*", headers: :any, methods: %i[get post options], credentials: true
        end
      end

      allow do
        origins "*"
        resource "/public/*", headers: :any, methods: :get
      end
    end
  end
end
