#!/usr/bin/env bash
set -e
if ! command -v cloudflared >/dev/null 2>&1; then
  echo "Инсталирам cloudflared (иска парола за sudo)..."
  curl -L -o /tmp/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
  sudo dpkg -i /tmp/cloudflared.deb
fi
echo ""
echo "Търси реда с https://....trycloudflare.com - това е адресът за телефона."
echo "Отвори го в Safari, после Сподели -> Добави към началния екран."
echo "Компютърът трябва да е включен и start.sh да работи. Спиране: Ctrl+C"
cloudflared tunnel --url http://localhost:8080
