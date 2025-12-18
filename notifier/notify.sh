#!/bin/bash

LOG="/state/cloudflared.log"
STATE="/state/current_url.txt"

TOKEN="${TELEGRAM_BOT_TOKEN}"
CHAT_ID="${TELEGRAM_CHAT_ID}"

URL=$(grep -o 'https://.*trycloudflare.com' "$LOG" | tail -n1)
[ -z "$URL" ] && exit 0

LAST=""
[ -f "$STATE" ] && LAST=$(cat "$STATE")

TEXT="VPN Online
$URL
$(date)"

if [ "$URL" != "$LAST" ]; then
  echo "$URL" > "$STATE"
  TEXT="$TEXT
URL changed"
fi

curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
  -d chat_id="${CHAT_ID}" \
  -d text="$TEXT" > /dev/null
