#### BASE ####
FROM ubuntu:16.04 as idf-base

RUN mkdir -p /opt/build/idf
WORKDIR /opt/build/idf

COPY docker/install-deps.sh .
RUN bash install-deps.sh

#### BUILD ####
FROM idf-base as idf-build

WORKDIR /opt/build/idf

COPY docker/build-idf.sh .
RUN bash build-idf.sh

#### CLEANING ####
FROM idf-build as idf-clean

RUN rm -rf /opt/build/idf/IDF

#### CONFIG ####
FROM idf-clean as idf-create-conf

WORKDIR /opt/build/idf

COPY docker/create-conf-file.sh .
RUN bash create-conf-file.sh

#### RUNTIME ####
from idf-create-conf as idf-dash-run

EXPOSE 9999
EXPOSE 9998

WORKDIR /opt/build/idf
COPY docker/entrypoint.sh .

VOLUME /opt/run/idf/data

CMD ["/bin/bash", "entrypoint.sh"]
