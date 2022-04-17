# start a redis instance
#docker run --name some-redis -d redis
docker run -p 6379:6379 --name redis -d redis

# start with persistent storage
#docker run --name some-redis -d redis redis-server --save 60 1 --loglevel warning

# connecting via redis-cli
#docker run -it --network some-network --rm redis redis-cli -h some-redis

# Additionally, If you want to use your own redis.conf ...
# You can create your own Dockerfile that adds a redis.conf from the context into /data/, like so.

# Alternatively, you can specify something along the same lines with docker run options.
#docker run -v /myredis/conf:/usr/local/etc/redis --name myredis redis redis-server /usr/local/etc/redis/redis.conf
# Where /myredis/conf/ is a local directory containing your redis.conf file. Using this method means that there is no need for you to have a Dockerfile for your redis container.
