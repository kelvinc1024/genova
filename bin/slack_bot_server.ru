require_relative '../config/environment'

SlackRubyBotServer.configure do |config|
  config.oauth_version = :v2
  config.oauth_scope = ['app_mentions:read', 'chat:write']

  logger = Logger.new(STDOUT)
  logger.extend(ActiveSupport::Logger.broadcast(ActiveSupport::Logger.new(STDOUT)))

  config.logger = logger
end

run SlackRubyBotServer::Api::Middleware.instance
