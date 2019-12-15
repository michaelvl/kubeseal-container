FROM alpine:3.8

ARG KUBESEAL_VERSION
ENV KUBESEAL_VERSION=$KUBESEAL_VERSION

RUN apk add --update ca-certificates && apk add --update -t deps curl \
    && curl -sLo /usr/local/bin/kubeseal https://github.com/bitnami-labs/sealed-secrets/releases/download/${KUBESEAL_VERSION}/kubeseal-linux-amd64 \
    && chmod +x /usr/local/bin/kubeseal \
    && apk del --purge deps \
    && rm /var/cache/apk/*

# Placeholder, mount folder containing manifest files
RUN mkdir /work
WORKDIR /work

ENTRYPOINT ["/usr/local/bin/kubeseal"]
CMD ["-h"]
