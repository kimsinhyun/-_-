# frozen_string_literal: true
# require "sidekiq/middleware/sentry_error_logger"

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDIS_URL", ENV["REDIS_URL"]) }
  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end
end

Sidekiq.configure_server do |config|
  config.death_handlers << ->(job, ex) do
    msg = <<~MSG.strip
      *#{Rails.env} Sidekiq Worker Failed*
      Worker: #{job["class"]} #{job["jid"]}
      error: #{ex.message}
    MSG

    # SlackWebhookService.send_message(
    #   "Sidekiq Worker Failed",
    #   msg
    # )
    # Sentry.capture_message(msg)
  end
  config.logger.formatter = Sidekiq::Logger::Formatters::JSON.new
  config.redis = { url: ENV.fetch("REDIS_URL", ENV["REDIS_URL"]) }
  config.server_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Server
    # chain.add Sidekiq::Middleware::SentryErrorLogger
  end

  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end

  SidekiqUniqueJobs::Server.configure(config)
end

SidekiqUniqueJobs.configure do |config|
  config.lock_info = true
end

schedule_file = "config/sidekiq_schedule.yml"
# Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file) && Sidekiq.server?
