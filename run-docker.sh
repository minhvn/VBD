#!/bin/bash

docker volume create idf_data
docker run -it -d -v idf_data:/opt/run/idf/data \
    -p9999:9999 -p127.0.0.1:9998:9998 vietlq/idf-ubuntu
docker ps -a
