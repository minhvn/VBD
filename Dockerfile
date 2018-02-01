#### BASE ####
FROM ubuntu:16.04 as vbd-base

RUN mkdir -p /opt/build/vbd
WORKDIR /opt/build/vbd

COPY docker/install-deps.sh .
RUN bash install-deps.sh

#### RUNTIME ####
FROM vbd-base as vbd-runtime

WORKDIR /opt/build/vbd

COPY docker/build-vbd.sh .
RUN bash build-vbd.sh
