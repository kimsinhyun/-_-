# config/initializers/session_store.rb

# Application.config.session_store :cookie_store, key: '_app_session'

Rails.application.config.session_store :redis_session_store,
                                       key: "proj1_session",
                                       redis: {
                                         expire_after: 14.days,  # cookie expiration
                                         key_prefix: "proj1:session:",
                                         url: ENV["REDIS_URL"]
                                       }