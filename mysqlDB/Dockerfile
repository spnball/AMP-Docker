FROM mysql:5.6

COPY ./th-debian-source.list /etc/apt/sources.list.d/

RUN apt-get update && apt-get install -y openssh-client tar --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY ./db-entrypoint.sh /
COPY ./db-importer.sh /
COPY ${DEV_SSH_PRIVATE_KEY} /root/.ssh/id_rsa

RUN chmod 600 /root/.ssh/id_rsa

ENTRYPOINT ["/db-entrypoint.sh"]

CMD ["mysqld"]
