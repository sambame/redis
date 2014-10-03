FROM ubuntu:12.04
MAINTAINER Shay Erlichmen <shay@samba.me>

RUN         apt-get -yqq update
RUN         DEBIAN_FRONTEND=noninteractive apt-get -yqq install build-essential tcl8.5 wget
RUN         wget http://download.redis.io/releases/redis-2.8.17.tar.gz ; tar xvzf redis-2.8.17.tar.gz ; rm redis-2.8.17.tar.gz
RUN         cd redis-2.8.17 ; make ; make install ; cd .. ; rm -rf redis-2.8.17
RUN         /usr/local/bin/redis-server --version
ADD         redis.conf /conf/redis.conf
EXPOSE      6379
ENTRYPOINT  ["/usr/local/bin/redis-server", "/conf/redis.conf"]