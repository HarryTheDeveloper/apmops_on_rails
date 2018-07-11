Devise.setup do |config|
  # The e-mail address that mail will appear to be sent from
  # If absent, mail is sent from "please-change-me-at-config-initializers-devise@example.com"
  # TODO: CHANGE THIS
  # config.mailer_sender = "support@myapp.com"
  #
  # If using rails-api, you may want to tell devise to not use ActionDispatch::Flash
  # middleware b/c rails-api does not include it.
  # See: https://stackoverflow.com/q/19600905/806956
  config.navigational_formats = [:json]

  config.secret_key = Rails.application.credentials.dig(:devise_token_auth, :secret_key) if Rails.env.production?
end