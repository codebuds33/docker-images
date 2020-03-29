#!/bin/sh
set -e

if [ "$1" = 'ssh-config' ]; then
  if [ -z "$SSH_KEY" ]; then
    echo "No SSH_KEY set"
    exit 0
  elif [ -z "$SSH_HOST" ]; then
  if [ -z "$SSH_HOST" ]; then
    echo "No SSH_HOST set"
    exit 0
  else
    eval $(ssh-agent -s)
    echo "-----BEGIN RSA PRIVATE KEY-----
	Set private key for testing (a multiline env is not yet able to set to an external .env file
    -----END RSA PRIVATE KEY-----" | ssh-add - > /dev/null
    cat ~/.ssh/private-key
    echo "Added private address"
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    printf "Host $SSH_HOST\n  StrictHostKeyChecking no\n" > ~/.ssh/config
    echo "Added to config file"
    printf "$SSH_HOST" > ~/.ssh/remote_ip
    echo "alias ssh-remote='ssh exploit@$(cat ~/.ssh/remote_ip)'" > ~/.profile
    echo "export ssh-remote" >> ~/.profile
    tail -f /dev/null
  fi
else
  exec "$@"
fi


