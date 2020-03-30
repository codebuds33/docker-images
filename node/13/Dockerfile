FROM node:13-alpine

RUN apk --no-cache update
RUN apk add --no-cache git make bash g++ zlib-dev libpng-dev jpeg-dev
RUN rm -fr /var/cache/apk/*

RUN yarn add imagemin-mozjpeg imagemin-pngquant imagemin-svgo  webp-loader lqip-loader responsive-loader sqip-loader jimp
RUN yarn cache clean
