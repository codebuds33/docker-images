FROM alpine:3.11


RUN apk update \
   && apk add --no-cache openssh rsync git
#  && apk add --no-cache openssh rsync git \
#  && mkdir -p ~/.ssh \
#  && touch ~/.ssh/private-key \
#  && chmod 600 ~/.ssh/private-key \
#  && chmod 700 ~/.ssh
#
#COPY docker-entrypoint.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/docker-entrypoint.sh
#
#ENTRYPOINT ["docker-entrypoint.sh"]
#
#CMD ["ssh-config"]
