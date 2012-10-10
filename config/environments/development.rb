Anecs::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Action mailder delivery method
  # config.action_mailer.delivery_method = :sendmail

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = true

  # ARufanov: there isn't by default
  # config.assets.manifest = Rails.root.join("public/assets")

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( website.js website.css )

  # Expands the lines which load the assets
  config.assets.debug = true
end

# Use SMTP in dev enviroment uncomment this
# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.raise_delivery_errors = true
# ActionMailer::Base.default_charset = "utf-8"
# ActionMailer::Base.smtp_settings = { 
#   :address => "example.com", 
#   :port => 25, 
#   :domain => "example.com", 
#   :user_name => "postmaster@example.com", 
#   :password => "password", 
#   :authentication => :plain 
# } 

# File with individual settings if necessary
# mydevelopment_path = "#{::Rails.root.to_s}/config/environments/mydevelopment.rb"
# load(mydevelopment_path) if File.exist?(mydevelopment_path)
