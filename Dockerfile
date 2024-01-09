FROM debian:12 AS build
RUN apt update && \
    apt install wget && \
    wget -O /tini https://github.com/krallin/tini/releases/download/v0.19.0/tini-amd64

FROM honeygain/honeygain:latest /tini /tini
COPY --from=build --chmod=777 
USER appuser
ENV LD_LIBRARY_PATH=/usr/lib
WORKDIR /app
ENTRYPOINT ["/tini", "--"]
