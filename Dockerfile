FROM debian
 
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    curl \
    dirmngr \
    gpg
 
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture).asc" \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu
 
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
 
WORKDIR /project
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]