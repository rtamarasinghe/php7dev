FROM php:7.1-apache
MAINTAINER Ruchira Amarasinghe <ruchira@orangehrm.com>

WORKDIR /var/www/html

#Install dependent software
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes \
  cron \
  libreoffice-common \
  libreoffice-draw \
  libreoffice-writer \
  libpng12-dev \
  libjpeg-dev \
  libxml2-dev \
  mysql-client \
  poppler-utils \
  unzip \
  zip \
  && yes "" 
