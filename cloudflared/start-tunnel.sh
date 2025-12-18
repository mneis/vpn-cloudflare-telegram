#!/bin/bash

LOG=/state/cloudflared.log

cloudflared tunnel \
  --url tcp://openvpn:1194 \
  --logfile $LOG \
  --loglevel info
