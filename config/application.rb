require_relative 'boot'

require "rails/all"
# Pick the frameworks you want:
#require "active_model/railtie"
#require "active_job/railtie"
#require "active_record/railtie"
#require "active_storage/engine"
#require "action_controller/railtie"
#require "action_mailer/railtie"
#require "action_view/railtie"
##require "action_cable/engine"
#require "sprockets/railtie"
#require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module WebredesPsql
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Mexico City'
    config.i18n.default_locale = 'es-MX'
    config.generators.system_tests = nil
    config.middleware.use Rack::MethodOverride
    config.autoload_paths << Rails.root.join("lib")
    config.session_store :cookie_store
	  config.middleware.use ActionDispatch::Cookies
	  config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
     


  end
end
