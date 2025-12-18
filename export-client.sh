#!/bin/bash
set -e

CLIENT_NAME=${1:-client}

docker run --rm -v $PWD/openvpn:/etc/openvpn kylemanna/openvpn \
  easyrsa build-client-full $CLIENT_NAME nopass

docker run --rm -v $PWD/openvpn:/etc/openvpn kylemanna/openvpn \
  ovpn_getclient $CLIENT_NAME > ${CLIENT_NAME}.ovpn

echo "Client exported: ${CLIENT_NAME}.ovpn"
