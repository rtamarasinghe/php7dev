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
  && apt-get install -y --no-install-recommends \
    libfreetype6-dev \
    libgd-tools \
    libjpeg-dev \
    libjpeg62-turbo-dev \
    libldap2-dev \
    libmcrypt-dev \
    libpng12-dev \
    zlib1g-dev \
  && pecl channel-update pecl.php.net \
  && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
  && docker-php-ext-configure gd --with-jpeg-dir=/usr/lib/x86_64-linux-gnu --with-png-dir=/usr/lib/x86_64-linux-gnu --with-freetype-dir=/usr/lib/x86_64-linux-gnu \
  && docker-php-ext-install \
     bcmath \
     calendar \
     exif \
     gd \
     gettext \
     ldap \
     mysqli \
     pdo \
     pdo_mysql \
     opcache \
     soap \
     zip \
  && pecl install stats-2.0.3 \
  && docker-php-ext-enable stats \
  && yes "" | pecl install apcu \
  && docker-php-ext-enable apcu \
  && apt-get purge -y --auto-remove \
    libfreetype6-dev \
    libgd-tools \
    libjpeg62-turbo-dev \
    libjpeg-dev \
    libldap2-dev \
    libmcrypt-dev \
    libpng12-dev \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*
