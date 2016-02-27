require "redis_env/version"
require "redis_env/client"

module RedisEnv
  def self.new(*args)
    Client.new(*args)
  end
end
