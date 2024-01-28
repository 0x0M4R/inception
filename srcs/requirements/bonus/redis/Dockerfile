FROM debian:bookworm
RUN         apt-get update && apt-get install -y redis-server
EXPOSE      6379
CMD         ["/usr/bin/redis-server","--daemonize no", "--protected-mode no"]