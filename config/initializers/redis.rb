require "redis"

REDIS_CLIENT = Redis.new(host: 'localhost', port: 6379, db: 1)
if Rails.env == 'test'
  REDIS_CLIENT.select(0)
  REDIS_CLIENT.flushdb
end