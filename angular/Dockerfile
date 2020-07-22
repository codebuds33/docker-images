FROM node:14-alpine

RUN addgroup -g 1000 exploit
RUN adduser -u 1000 -D -S -G exploit exploit

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN yarn global add @angular/cli

WORKDIR /app
