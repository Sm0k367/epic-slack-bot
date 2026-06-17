# Epic Agent - 24/7/365 Setup Guide

## Option 1: Systemd Service (RECOMMENDED - survives reboots)

```bash
# Run this once as root/sudo
sudo /workspace/.kortix/systemd/install_24_7.sh
```

Then control with:
```bash
sudo systemctl status epic-agent      # Check if running
sudo systemctl restart epic-agent     # Restart
sudo journalctl -u epic-agent -f      # Live logs
```

The bot will auto-start on server reboot and auto-restart on crash.

---

## Option 2: Simple Background (no sudo needed)

```bash
# Start it
nohup python3 /workspace/EpicAgent_ULTIMATE.py > /workspace/epic_ultimate.log 2>&1 &

# Check it's running
ps aux | grep EpicAgent_ULTIMATE

# Watch logs
tail -f /workspace/epic_ultimate.log
```

To stop:
```bash
pkill -f EpicAgent_ULTIMATE.py
```

---

## Option 3: Auto-Restart Wrapper (survives crashes)

```bash
# Start with auto-restart on crash
/workspace/START_24_7.sh
```

This script auto-restarts the bot if it crashes.

---

## Option 4: Screen Session (survives terminal disconnect)

```bash
# Install screen
sudo apt-get install screen -y

# Start bot in detached screen
screen -dmS epic-bot python3 /workspace/EpicAgent_ULTIMATE.py

# Reattach to see logs (optional)
screen -r epic-bot

# Detach: Ctrl+A then D
# Kill: screen -X -S epic-bot quit
```

---

## GitHub Repo

https://github.com/Sm0k367/epic-slack-bot

---

## Current Status

The bot is configured and ready. Choose Option 1 (systemd) for true 24/7 operation that survives server reboots.
