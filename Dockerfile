FROM debian:12 AS build
RUN apt update && \
    apt install -y \
        wget && \
    wget -O /tini https://github.com/krallin/tini/releases/download/v0.19.0/tini-amd64

FROM honeygain/honeygain:latest
COPY --from=build --chmod=777 /tini /tini
USER appuser
ENV LD_LIBRARY_PATH=/usr/lib
WORKDIR /app
ENTRYPOINT ["/tini", "--"]
