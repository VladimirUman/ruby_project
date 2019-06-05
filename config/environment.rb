# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Depot::Application.configure do
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "domain.of.sender.net",
    authentication: "plain",
    user_name: "vladimiruman81@gmail.com",
    password: "rtktwrfz112",
    enable_starttls_auto: true
  }

  config.gem 'redis'
end

Time::DATE_FORMATS[:my_datetime] = "%d.%m.%Y %k:%M"
