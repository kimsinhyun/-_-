class ApplicationController < ActionController::Base
  before_action do
    if Rails.env.development? || Rails.env.test?
      ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
    else
      ActiveStorage::Current.url_options = { host: "https://your-cdn-domain.com" }
    end
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!
end
