# Be sure to restart your server when you modify this file.
# Rails.application.config.middleware.use ExceptionNotifier,
Anecs::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[www.Anecs.com] ",
  :sender_address => %{"Exception Notifier" <webmaster@majoron.com>},
  :exception_recipients => %w{webmaster@majoron.com},
  :ignore_exceptions => []
