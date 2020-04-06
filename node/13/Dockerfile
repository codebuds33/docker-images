FROM node:13-alpine

RUN addgroup -g 82 www-data
RUN adduser -u 82 -D -S -G www-data www-data

RUN apk --no-cache update
RUN apk add --no-cache make g++ libpng-dev jpeg-dev libjpeg jpeg su-exec
RUN rm -fr /var/cache/apk/*

RUN yarn add imagemin-mozjpeg imagemin-pngquant imagemin-svgo  webp-loader lqip-loader responsive-loader sqip-loader jimp
RUN yarn cache clean