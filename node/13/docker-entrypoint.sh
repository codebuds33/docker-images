#!/bin/sh
set -e

if [ "$1" = 'start' ]; then
  if [ "$2" = 'nuxt' ]; then
    yarn build
    pm2 start --no-daemon
  else
    pm2 start ${@:2}
  fi
elif [ "$1" = 'restart' ]; then
    pm2 restart ${@:2}
else
  exec "$@"
fi


