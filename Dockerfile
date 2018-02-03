#### BASE ####
FROM ubuntu:16.04 as vbd-base

RUN mkdir -p /opt/build/vbd
WORKDIR /opt/build/vbd

COPY docker/install-deps.sh .
RUN bash install-deps.sh

#### BUILD ####
FROM vbd-base as vbd-build

WORKDIR /opt/build/vbd

COPY docker/build-vbd.sh .
RUN bash build-vbd.sh

#### CONFIG ####
FROM vbd-build as vbd-create-conf

VOLUME /opt/run/vbd
WORKDIR /opt/run/vbd

COPY docker/create-conf-file.sh .
RUN bash create-conf-file.sh

#### RUNTIME ####
from vbd-create-conf as vbd-dash-run

EXPOSE 9999

VOLUME /opt/run/vbd
WORKDIR /opt/run/vbd
COPY docker/entrypoint.sh .

CMD ["/bin/bash", "entrypoint.sh"]
