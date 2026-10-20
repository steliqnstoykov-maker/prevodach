#!/usr/bin/env bash
cd "$HOME/prevodach"
if ! ss -ltn | grep -q ':8080 '; then
  nohup python3 -m http.server 8080 >/dev/null 2>&1 &
  sleep 1
fi
for b in google-chrome google-chrome-stable chromium chromium-browser; do
  if command -v "$b" >/dev/null 2>&1; then exec "$b" --app=http://localhost:8080; fi
done
xdg-open http://localhost:8080
