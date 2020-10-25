FROM php:7.4.11-fpm-alpine

ENV APCU_VERSION 5.1.19
ENV MCRYPT_VERSION 1.0.3
ENV COMPOSER_VERSION 2.0.1
ENV TZ Europe/Paris

COPY my-config.ini /usr/local/etc/php/conf.d/.
COPY opcache.ini /usr/local/etc/php/conf.d/.

RUN apk upgrade -U -a \
    && apk add --no-cache \
    bash \
    tzdata \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

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
        su-exec \
        libxslt-dev \
        libgcrypt-dev \
        wkhtmltopdf

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
    && docker-php-ext-install opcache \
    && docker-php-ext-install xsl

#Install composer programmatically
COPY install-composer.sh /install-composer.sh
RUN chmod +x /install-composer.sh \
    && /install-composer.sh

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
