# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Depot::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 465,
    domain: "domain.of.sender.net",
    authentication: "plain",
    user_name: "vladimiruman81",
    password: "rtktwrfz112",
    enable_starttls_auto: true
  }
end
