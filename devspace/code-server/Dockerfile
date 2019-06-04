FROM ruby:2.6.2

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install -y \
    mysql-server \
    mysql-client \
    default-libmysqlclient-dev \
    vim \
    nodejs \
    wget \
    locales \
    --no-install-recommends \
  && apt-get clean \
  && sed -i -e 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN locale-gen en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV CODE_SERVER_VER=1.1119-vsc1.33.1

# Download code-server to /opt
RUN wget "https://github.com/cdr/code-server/releases/download/${CODE_SERVER_VER}/code-server${CODE_SERVER_VER}-linux-x64.tar.gz" \
    -P /opt/ \
  && tar -xvzf "/opt/code-server${CODE_SERVER_VER}-linux-x64.tar.gz" -C /opt \
  && rm -f "/opt/code-server${CODE_SERVER_VER}-linux-x64.tar.gz" \
  && mv "/opt/code-server${CODE_SERVER_VER}-linux-x64" /opt/code-server-linux

COPY open-remote-connections.sql /tmp
COPY entrypoint.sh /usr/local/bin/

RUN gem install rails -v '5.2.2' \
  && chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /data

ENTRYPOINT ["entrypoint.sh"]
CMD tail -f /dev/null
