FROM php:7.4-fpm-alpine

ENV APCU_VERSION 5.1.18
ENV MCRYPT_VERSION 1.0.3

COPY my-config.ini /usr/local/etc/php/conf.d/.

RUN apk --no-cache update \
    && apk --no-cache upgrade

RUN apk add --no-cache \
        $PHPIZE_DEPS \
        libzip-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        zlib-dev \
        libpng-dev \
        libwebp-dev \
        icu-dev \
        g++ \
        exiftool \
        git \
        su-exec

RUN pecl install apcu-${APCU_VERSION} \
    && docker-php-ext-enable apcu \
    && pecl install mcrypt-${MCRYPT_VERSION} \
    && docker-php-ext-enable mcrypt
    
#Configure, install and enable all php packages
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ --with-webp=/usr/include/ \
    && docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure exif

RUN docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install zip \
    && docker-php-ext-install intl \
    && docker-php-ext-install iconv \
    && docker-php-ext-install exif \
    && docker-php-ext-install opcache

#Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && mv composer /usr/local/bin/composer

#Remove cached files
RUN docker-php-source delete \
    && pecl clear-cache \
    && rm -rf \
        /usr/include/php \
        /usr/lib/php/build \
        /tmp/* \
        /var/lib/apt/lists/* \
        /root/.composer

WORKDIR /var/www/symfony

RUN PATH=$PATH:/usr/src/apps/vendor/bin:bin
