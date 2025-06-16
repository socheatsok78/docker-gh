ARG GH_VERSION=2.74.1

FROM alpine:latest AS gh
ARG TARGETARCH
ARG GH_VERSION
ADD https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_${TARGETARCH}.tar.gz /tmp/gh.tar.gz
WORKDIR /tmp/gh
RUN <<EOT
    tar -xzf /tmp/gh.tar.gz -C /tmp/gh --strip-components=1
    rm /tmp/gh/LICENSE
EOT

FROM scratch
COPY --from=gh --link /tmp/gh /
