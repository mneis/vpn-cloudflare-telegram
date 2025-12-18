# VPN over Cloudflare (Free) with Telegram Notifications

This project runs an OpenVPN server (TCP) on a Raspberry Pi using Docker,
exposed via Cloudflare's free ephemeral tunnel and reports the active
VPN URL to a Telegram group.

## Setup

```bash
cp .env.example .env
# fill Telegram bot token & chat ID
./start.sh
```

## Export VPN client

```bash
./export-client.sh
```

## Notes
- Cloudflare free tunnels rotate URLs
- TCP only (UDP not supported on free tunnels)
