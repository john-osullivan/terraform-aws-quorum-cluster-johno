#!/bin/bash
set -eu -o pipefail

QUOR_ROOT=/opt/quorum

sudo mkdir $QUOR_ROOT
sudo mkdir $QUOR_ROOT/bin
sudo mkdir $QUOR_ROOT/info
sudo mkdir $QUOR_ROOT/private
sudo mkdir $QUOR_ROOT/log
sudo mkdir $QUOR_ROOT/lib
sudo mkdir $QUOR_ROOT/constellation
sudo mkdir $QUOR_ROOT/constellation/private
sudo mkdir $QUOR_ROOT/constellation/private/keystore
sudo chown -R ubuntu $QUOR_ROOT
sudo chmod -R 777 $QUOR_ROOT
