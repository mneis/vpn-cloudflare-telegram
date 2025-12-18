#!/bin/bash
set -e

mkdir -p openvpn state

./init-openvpn.sh

docker compose build
docker compose up -d

echo "VPN stack running"
