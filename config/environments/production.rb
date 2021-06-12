require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = false
  config.active_storage.service = :local
  config.log_level = :info
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.active_support.disallowed_deprecation = :log
  config.active_support.disallowed_deprecation_warnings = []
  config.log_formatter = ::Logger::Formatter.new
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false

  config.action_mailer.port =           ENV['SPARKPOST_SMTP_PORT'],
  config.action_mailer.address =        ENV['SPARKPOST_SMTP_HOST'],
  config.action_mailer.user_name =      ENV['SPARKPOST_SMTP_USERNAME'],
  config.action_mailer.password =       ENV['SPARKPOST_SMTP_PASSWORD'],
  config.action_mailer.authentication = :login,
  config.action_mailer.enable_starttls_auto = true
  config.action_mailer.default_url_options = { :host => 'example.com' }
end
