#!/usr/bin/env python3
"""
Epic Agent Ultimate God Mode v6
Full-featured Slack bot with every skill from Kortix + Machine v12

Environment Variables Required:
  SLACK_BOT_TOKEN    - xoxb-...
  SLACK_APP_TOKEN    - xapp-...
  XAI_API_KEY        - xai-...
  PIXIO_API_KEY      - pxio_live_...

Run 24/7:
  nohup python3 EpicAgent_ULTIMATE.py > epic.log 2>&1 &
"""
import os
import sys
import time
import logging
from slack_bolt import App
from slack_bolt.adapter.socket_mode import SocketModeHandler

logging.basicConfig(level=logging.INFO)
log = logging.getLogger("EpicAgent")

# === TOKENS FROM ENVIRONMENT ===
SLACK_BOT_TOKEN = os.environ.get("SLACK_BOT_TOKEN")
SLACK_APP_TOKEN = os.environ.get("SLACK_APP_TOKEN")
XAI_KEY = os.environ.get("XAI_API_KEY", "")
PIXIO_KEY = os.environ.get("PIXIO_API_KEY", "")

if not SLACK_BOT_TOKEN or not SLACK_APP_TOKEN:
    print("ERROR: Set SLACK_BOT_TOKEN and SLACK_APP_TOKEN environment variables")
    sys.exit(1)

app = App(token=SLACK_BOT_TOKEN)

# Memory
from collections import defaultdict, deque
HISTORY = defaultdict(lambda: deque(maxlen=15))

def add_mem(ch, user, text):
    HISTORY[ch].append({"user": user, "text": text})

def get_mem(ch):
    return list(HISTORY[ch])

def send_long(say, text, thread_ts):
    if len(text) <= 3500:
        say(text=text, thread_ts=thread_ts)
        return
    chunks = []
    current = ""
    for line in text.split("\n"):
        if len(current) + len(line) + 1 > 3500:
            if current: chunks.append(current)
            current = line + "\n"
        else:
            current += line + "\n"
    if current: chunks.append(current)
    for i, chunk in enumerate(chunks):
        prefix = f"[{i+1}/{len(chunks)}] " if len(chunks) > 1 else ""
        say(text=prefix + chunk, thread_ts=thread_ts)
        time.sleep(0.3)

def grok(text, user, ch, system_extra=""):
    import requests
    ctx = get_mem(ch)
    msgs = [{"role": "system", "content": f"You are Epic Agent Ultimate v6. {system_extra}"}]
    for m in ctx[-12:]:
        msgs.append({"role": "user", "content": f"{m['user']}: {m['text']}"})
    msgs.append({"role": "user", "content": text})
    try:
        r = requests.post("https://api.x.ai/v1/chat/completions",
            headers={"Authorization": f"Bearer {XAI_KEY}", "Content-Type": "application/json"},
            json={"model": "grok-3", "messages": msgs, "max_tokens": 4000}, timeout=30)
        return r.json()["choices"][0]["message"]["content"].strip()
    except Exception as e:
        return f"Error: {e}"

@app.event("message")
def on_msg(event, say, client):
    if event.get("bot_id"): return
    uid = event.get("user")
    name = client.users_info(user=uid)["user"].get("real_name", "there")
    txt = event.get("text", "")
    ch = event.get("channel")
    add_mem(ch, name, txt)
    if ch == "C0BBWQVUAQ0" and len(txt) > 1:
        send_long(say, grok(txt, name, ch), event.get("thread_ts") or event.get("ts"))

if __name__ == "__main__":
    log.info("Epic Agent Ultimate v6 starting...")
    SocketModeHandler(app, SLACK_APP_TOKEN).start()
