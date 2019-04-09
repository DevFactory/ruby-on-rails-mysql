# DOCKER FILE 

FROM ruby:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
&& apt-get install -y mysql-server mysql-client default-libmysqlclient-dev vim nodejs --no-install-recommends \
&& apt-get clean \
&& sed -i -e 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY  open-remote-connections.sql /tmp

# This Dockerfile doesn't need to have an entrypoint and a command
# as Bitbucket Pipelines will overwrite it with a bash script.

RUN gem install rails -v '5.2.2'

CMD /etc/init.d/mysql start \
&& mysql < /tmp/open-remote-connections.sql \
&& tail -f /dev/null
