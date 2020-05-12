FROM webdevops/php-nginx:7.1

RUN apt-get update
RUN apt-get -y upgrade

## Composer install

# RUN curl -sS https://getcomposer.org/installer | php
# RUN mv composer.phar /usr/local/bin/composer

# openssh-server
# RUN apt-get update && apt-get install -y openssh-server
# RUN mkdir /var/run/sshd
# RUN echo 'root:1' | chpasswd
# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# ENV NOTVISIBLE "in users profile"
# RUN echo "export VISIBLE=now" >> /etc/profile
# RUN /usr/sbin/sshd -D

## Install cron
#RUN apt-get -y install cron

## -----------------------------Network tool-----------------------------
RUN apt-get -y install htop
RUN apt-get -y install net-tools
RUN apt-get -y install iproute2

## -----------------------------Install builtin cron-----------------------------
RUN docker-service-enable cron

## Copy hello-cron file to the cron.d directory
COPY ./cron/mgt-cron /etc/cron.d/mgt-cron

## Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/mgt-cron

## Apply cron job
RUN crontab /etc/cron.d/mgt-cron

## Create the log file to be able to run tail
RUN touch /var/log/cron.log

# -----------------------------Ports: apache2, xdebug-----------------------------
EXPOSE 80 9000 22 443

## ----------------------------- supervisord script -----------------------------
## Run file
ADD ./service.d/get-container-ip.sh /opt/docker/bin/service.d/get-container-ip.sh
RUN chmod 755 /opt/docker/bin/service.d/get-container-ip.sh
## Config file
ADD ./service.d/get-container-ip.conf /opt/docker/etc/supervisor.d/get-container-ip.conf
RUN chmod 644 /opt/docker/etc/supervisor.d/get-container-ip.conf

##

## -----------------------------default application-----------------------------
COPY ./html /app

## -----------------------------config PHP/Nginx-----------------------------
COPY ./php/php.ini /opt/docker/etc/php/php.ini

## Setup php-fpm
COPY ./nginx/conf.d /opt/docker/etc/nginx/conf.d
COPY ./nginx/vhost.conf /opt/docker/etc/nginx/vhost.conf
RUN chmod 644 /opt/docker/etc/nginx/conf.d/11-php.conf
RUN chmod 644 /opt/docker/etc/nginx/vhost.conf

## -----------------------------ADD helper-----------------------------
ADD ./bin/setup-mgt.sh /usr/local/bin/setup-mgt.sh
ADD ./bin/debug.sh /usr/local/bin/debug.sh
ADD ./bin/xon.sh /usr/local/bin/xon
ADD ./bin/xoff.sh /usr/local/bin/xoff
RUN chmod 755 /usr/local/bin/setup-mgt.sh
RUN chmod 755 /usr/local/bin/debug.sh
RUN chmod 755 /usr/local/bin/xon
RUN chmod 755 /usr/local/bin/xoff
