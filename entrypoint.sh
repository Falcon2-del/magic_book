#!/bin/sh
if [ -n "$PORT" ]; then
  sed -i "s/\"port\": [0-9]\+/\"port\": ${PORT}/g" /etc/sys-runtime/app-config.json
fi

exec xray run -config /etc/sys-runtime/app-config.json
