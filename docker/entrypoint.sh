#!/bin/bash

#adduser idf
#usermod -aG sudo idf
#su idf

ln -f -s /opt/run/idf/data ~/.idfcore
ln -f -s /opt/run/idf/.idfcore/idf.conf ~/.idfcore/

idfd -reindex-chainstate -conf=/opt/run/idf/.idfcore/idf.conf -datadir=/opt/run/idf/data
