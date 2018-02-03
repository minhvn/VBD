#!/bin/bash

#adduser vbd
#usermod -aG sudo vbd
#su vbd

vbdd -reindex-chainstate -conf=/opt/run/vbd/.vbdcore/vbd.conf -datadir=/opt/run/vbd/data
