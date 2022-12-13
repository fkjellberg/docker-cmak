FROM alpine:3.17.0 AS builder

ARG CMAK_VERSION="3.0.0.6"

RUN wget "https://github.com/yahoo/CMAK/releases/download/${CMAK_VERSION}/cmak-${CMAK_VERSION}.zip" \
    && unzip cmak-${CMAK_VERSION}.zip \
    && mv cmak-${CMAK_VERSION} cmak

FROM eclipse-temurin:11.0.17_8-jre-jammy

COPY --from=builder /cmak /cmak

WORKDIR /cmak

EXPOSE 9000

HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:9000/api/health || exit 1

ENTRYPOINT ["bin/cmak"]
CMD ["-Dconfig.file=conf/application.conf", "-Dhttp.port=9000"]
