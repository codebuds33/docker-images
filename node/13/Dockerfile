FROM node:13-alpine

RUN apk --no-cache update
RUN apk add --no-cache make g++ libpng-dev jpeg-dev libjpeg jpeg
RUN rm -fr /var/cache/apk/*

#RUN yarn add imagemin-mozjpeg imagemin-pngquant imagemin-svgo  webp-loader lqip-loader responsive-loader sqip-loader jimp
#RUN yarn cache clean
