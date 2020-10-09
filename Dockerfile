FROM marpteam/marp-cli:latest

USER root
RUN apk update && apk upgrade && \
    apk add --no-cache \
      bash@edge \
      git@edge

WORKDIR /home/marp/app
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
