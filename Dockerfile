FROM honeygain/honeygain:latest
ARG TINI_VERSION=v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64 /tini
USER appuser
ENV LD_LIBRARY_PATH=/usr/lib
WORKDIR /app
ENTRYPOINT ["/tini"]
