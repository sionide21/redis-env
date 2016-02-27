module RedisEnv
  class Client
    attr_reader :redis
    def initialize(redis, project=nil)
      @redis = redis
      @project = project || "__default__"
    end

    def variables
      redis.hgetall(namespace)
    end

    def set(name, value)
      redis.hset(namespace, name, value)
    end

    def bulk_set(vars)
      redis.mapped_hmset(namespace, vars)
    end

    def unset(name)
      redis.hdel(namespace, name)
    end

    def clear
      redis.del(namespace)
    end

    def namespace
      "redis-env:#{@project}"
    end
  end
end
