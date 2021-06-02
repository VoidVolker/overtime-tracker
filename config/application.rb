require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module OvertimeTracker
  class Application < Rails::Application
    config.load_defaults 6.1
    config.autoload_paths << Rails.root.join('lib')
    config.sass.load_paths += [ "#{Rails.root}/node_modules" ]
  end
end
