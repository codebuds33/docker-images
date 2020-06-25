FROM php:7.4.6-fpm-alpine

ENV APCU_VERSION 5.1.18
ENV MCRYPT_VERSION 1.0.3

COPY my-config.ini /usr/local/etc/php/conf.d/.
COPY opcache.ini /usr/local/etc/php/conf.d/.

RUN addgroup -g 1000 exploit
RUN adduser -u 1000 -D -S -G exploit exploit

RUN addgroup -g 1001 exploit2
RUN adduser -u 1001 -D -S -G exploit2 exploit2

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

#Install composer
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/4d7f8d40f9788de07c7f7b8946f340bf89535453/web/installer -O - -q | php -- --install-dir=/usr/local/bin --filename=composer

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
