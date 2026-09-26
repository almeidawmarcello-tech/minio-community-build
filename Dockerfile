FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY minio /usr/local/bin/minio

RUN chmod +x /usr/local/bin/minio

VOLUME ["/data"]

EXPOSE 9000 9001

ENTRYPOINT ["/usr/local/bin/minio"]

CMD ["server", "/data", "--console-address", ":9001"]
