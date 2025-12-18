#!/bin/bash
set -e

mkdir -p openvpn state

docker compose up -d

echo "✅ VPN stack running"
echo "ℹ️ OpenVPN-AS admin UI: https://<cloudflare-url>:943"
