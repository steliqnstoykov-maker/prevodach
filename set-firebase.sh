#!/usr/bin/env bash
cd "$HOME/prevodach"
echo "Постави firebaseConfig от Firebase (целия блок от { до }),"
echo "после натисни Enter и Ctrl+D:"
cat > /tmp/fbcfg.txt
python3 - <<'PY' || exit 1
import os,sys
t=open("/tmp/fbcfg.txt",encoding="utf-8").read()
a=t.find("{");b=t.rfind("}")
if a<0 or b<=a or "apiKey" not in t:
    sys.exit("Не намерих конфигурация (трябва да съдържа apiKey).")
open(os.path.expanduser("~/prevodach/firebase-config.js"),"w",encoding="utf-8").write("window.FIREBASE_CONFIG = "+t[a:b+1]+";\n")
print("Конфигурацията е записана.")
PY
git add -A
git commit -m "Firebase config" >/dev/null 2>&1 || true
git push
echo ""
echo "Готово! След 1-2 минути влизането с Google е активно."
