# DOCKER FILE

FROM ruby:2.6.2
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
&& apt-get install -y mysql-server mysql-client default-libmysqlclient-dev vim nodejs --no-install-recommends \
&& apt-get clean \
&& sed -i -e 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf \
&& sed -i 's/datadir.*/datadir        = \/data\/.mysql_data/g' /etc/mysql/mariadb.conf.d/50-server.cnf \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY open-remote-connections.sql /tmp
COPY entrypoint.sh /usr/local/bin/

RUN gem install rails -v '5.2.2' \
  && chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /data

ENTRYPOINT ["entrypoint.sh"]
CMD tail -f /dev/null
