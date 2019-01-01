# DOCKER FILE 

FROM ruby:2.3.1
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
&& apt-get install -y mysql-server mysql-client libmysqlclient-dev vim nodejs --no-install-recommends \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# This Dockerfile doesn't need to have an entrypoint and a command
# as Bitbucket Pipelines will overwrite it with a bash script.

RUN gem install rails -v '5.2.2'

# /etc/init.d/mysql start
