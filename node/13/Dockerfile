FROM node:13-alpine

RUN addgroup -g 82 www-data
RUN adduser -u 82 -D -S -G www-data www-data

RUN apk --no-cache update

RUN apk add --no-cache git make g++ libpng-dev jpeg-dev libjpeg jpeg su-exec

RUN rm -fr /var/cache/apk/*
