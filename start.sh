#!/usr/bin/env bash
cd "$HOME/prevodach"
URL="http://localhost:8080"
(
  sleep 1
  for b in google-chrome google-chrome-stable chromium chromium-browser; do
    if command -v "$b" >/dev/null 2>&1; then "$b" "$URL" >/dev/null 2>&1 & exit 0; fi
  done
  xdg-open "$URL" >/dev/null 2>&1 || true
) &
IP=$(hostname -I 2>/dev/null | awk '{print $1}')
echo "Преводачът работи на $URL  (спиране: Ctrl+C)"
echo "От телефона (същия Wi-Fi), САМО за писане на текст: http://$IP:8080"
echo "За гласа на телефона пусни в друг терминал: ~/prevodach/phone.sh"
python3 -m http.server 8080
