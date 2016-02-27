# Redis Env

Store your environment variables in Redis.

## Installation

    $ gem install redis_env

## Usage

```
Commands:
  redis-env clear           # Remove all environment variables
  redis-env exec COMMAND    # Run a COMMAND within the environment
  redis-env list            # List all variables
  redis-env load FILE       # Read an env file and load it into redis
  redis-env set NAME VALUE  # Set an environment variable called NAME to VALUE
  redis-env unset NAME      # Remove an environment variable called NAME

Options:
  [--project=PROJECT]  # The project these variables are for
  [--redis=REDIS]      # The url of the redis server
                       # Default: redis://localhost:6379/0
```

### Examples

Load your existing `.env` file

```
redis-env load --project my-awesome-app .env
```

Now run your app using redis-env

```
redis-env exec --project my-awesome-app rails s
```

### Programmatic Usage

```
require "redis_env"
client = RedisEnv.new(Redis.new, "my-awesome-app")

# Write keys
client.set("IMPORTANT_KEY", "VALUE")
client.bulk_set("IMPORTANT_KEY" => "NEW VALUE", "ANOTHER_KEY" => "banana")

# Use keys
SomeRestClient.new(url: client.variables["RELEVENT_URL"])
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sionide21/redis-env.
