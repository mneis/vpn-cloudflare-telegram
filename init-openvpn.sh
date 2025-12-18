#!/bin/bash
set -e

OVPN_DATA=./openvpn

if [ -f "$OVPN_DATA/pki/ca.crt" ]; then
  echo "OpenVPN already initialized."
  exit 0
fi

docker run --rm -v $PWD/openvpn:/etc/openvpn ghcr.io/wfg/openvpn \
  ovpn_genconfig -u tcp://localhost:1194

docker run --rm -v $PWD/openvpn:/etc/openvpn ghcr.io/wfg/openvpn \
  ovpn_initpki nopass
