FROM alpine:3.22

RUN apk add --no-cache ca-certificates

COPY minio /usr/local/bin/minio
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/minio \
    /usr/local/bin/docker-entrypoint.sh

VOLUME ["/data"]

EXPOSE 9000 9001

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["minio"]
