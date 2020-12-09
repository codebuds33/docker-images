FROM codebuds/php:prod-1.1.3

ENV XDEBUG_START_WITH_REQUEST=0 \
    XDEBUG_MAX_NESTING_LEVEL=9999 \
    XDEBUG_CLIENT_PORT=9003 \
    XDEBUG_IDEKEY=PHPSTORM \
    XDEBUG_MODE=debug \
    XDEBUG_VERSION=3.0.0

#Install Xdebug
RUN pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=$XDEBUG_MODE" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_port=$XDEBUG_CLIENT_PORT" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.max_nesting_level=$XDEBUG_MAX_NESTING_LEVEL" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.start_with_request=$XDEBUG_START_WITH_REQUEST" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey=$XDEBUG_IDEKEY" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && docker-php-ext-enable xdebug

#Set opcache config for dev
RUN grep -q '^opcache.validate_timestamps=0' /usr/local/etc/php/conf.d/opcache.ini \
    && sed -i 's/^opcache.validate_timestamps=0/opcache.validate_timestamps=1/' /usr/local/etc/php/conf.d/opcache.ini \
    || echo 'opcache.validate_timestamps=1' >> /usr/local/etc/php/conf.d/opcache.ini

#Install Symfony CLI
RUN wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

#Set global git
RUN git config --global user.email "you@example.com" && git config --global user.name "Your Name"

WORKDIR /var/www/symfony

RUN PATH=$PATH:/usr/src/apps/vendor/bin:bin
