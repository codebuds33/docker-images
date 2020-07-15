FROM mariadb:10.5

RUN apt-get update && apt-get install -y \
  autossh \
  && rm -rf /var/lib/apt/lists/*

RUN ssh-keygen -f ~/.ssh/id_rsa -P '' -t rsa -b 4096