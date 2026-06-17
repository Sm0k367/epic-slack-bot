# Epic Agent - 24/7/365 Setup (No Manual python3 Commands)

## Option 1: Quick Background Run (Recommended)

```bash
# Start the bot and forget about it
nohup python3 /workspace/EpicAgent_ULTIMATE.py > /workspace/epic_ultimate.log 2>&1 &

# Check it's running
ps aux | grep EpicAgent_ULTIMATE

# Watch logs live
tail -f /workspace/epic_ultimate.log
```

To stop it later:
```bash
pkill -f EpicAgent_ULTIMATE.py
```

---

## Option 2: Forever Auto-Restart Script (Best)

```bash
# Make the script executable (already done)
chmod +x /workspace/start_bot_forever.sh

# Run it once - the bot will now run forever with auto-restart
/workspace/start_bot_forever.sh
```

This script:
- Auto-restarts the bot if it crashes
- Logs everything to `/workspace/epic_ultimate.log`
- Saves PID to `/workspace/epic_agent.pid`
- Keeps running even if you close the terminal

To stop:
```bash
kill $(cat /workspace/epic_agent.pid)
```

---

## Option 3: Screen Session (Persistent Terminal)

```bash
# Install screen if needed
apt-get install screen -y

# Start bot in screen session
screen -dmS epic-agent python3 /workspace/EpicAgent_ULTIMATE.py

# Re-attach to see logs (optional)
screen -r epic-agent

# Detach: Ctrl+A then D
# Kill session: screen -X -S epic-agent quit
```

---

## Option 4: Systemd Service (True 24/7 - Requires Sudo)

```bash
# Run the install script
sudo /workspace/.kortix/systemd/install_service.sh

# Then control with:
sudo systemctl status epic-agent
sudo systemctl restart epic-agent
sudo journalctl -u epic-agent -f
```

---

## Recommended: Use Option 2

```bash
/workspace/start_bot_forever.sh
```

This is the simplest "set it and forget it" solution that doesn't require sudo or extra tools.

---

## Current Bot Status

Run this to check if bot is already running:
```bash
ps aux | grep EpicAgent_ULTIMATE | grep -v grep
```

If nothing shows, start it with Option 2 above.
