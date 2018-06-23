#!/bin/bash

#adduser idf
#usermod -aG sudo idf
#su idf

mkdir -p /opt/run/idf/.idfcore

cat > /opt/run/idf/.idfcore/idf.conf <<EOF
gen=1
server=1
listen=1
txindex=1
addnode=45.32.19.62
addnode=104.238.157.165
# When running outside Docker, set daemon=1
daemon=0
EOF
