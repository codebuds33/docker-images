FROM node:14-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh gettext

RUN yarn global add @angular/cli

WORKDIR /app
