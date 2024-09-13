# config/initializers/session_store.rb

# Application.config.session_store :cookie_store, key: '_app_session'

Rails.application.config.session_store :redis_store,
                                       servers: [ ENV["REDIS_URL"] ],
                                       expire_after: 14.days,
                                       key: "_proj1_session"
