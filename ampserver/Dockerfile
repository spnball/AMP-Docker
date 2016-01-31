FROM ubuntu:12.04
MAINTAINER Surapun Prasit <surapun.prasit@gmail.com>

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR ../../var/log/apache2

VOLUME ["/var/www"]

# install application package
RUN apt-get update && \
    apt-get install -y \
      apache2 \
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php5-gd \
      php5-mysql \
      mysql-client \
      php5-sqlite \
      git

# prepare entry point
COPY run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

# Set apache configuration
COPY apache/default.conf /etc/apache2/sites-available/default
RUN rm -f /etc/apache2/sites-enabled/000-default
RUN ln -sf /etc/apache2/sites-available/default /etc/apache2/sites-enabled/000-default.conf

COPY apache/amp.conf /etc/apache2/sites-available/amp.conf
RUN ln -sf /etc/apache2/sites-available/amp.conf /etc/apache2/sites-enabled/001-amp.conf

COPY info.php /root/info.php

# Prepare amp setting
COPY config/main-local.php /root/main-local.php
COPY config/main-local.php /root/param-local.php
COPY apache/common.conf /root/apache_common.conf

RUN a2enmod rewrite

# id_rsa for git
ADD ./id_rsa /root/.ssh/id_rsa

EXPOSE 80
CMD ["/usr/local/bin/run"]
