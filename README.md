# Epic Agent Ultimate v6

Full-featured Slack bot with every skill from Kortix + Machine v12.

**GitHub:** https://github.com/Sm0k367/epic-slack-bot

## 🚀 24/7 Operation (RECOMMENDED)

### Quick Start (One Command)

```bash
# Clone and setup
git clone https://github.com/Sm0k367/epic-slack-bot.git
cd epic-slack-bot

# Set your tokens (one time)
cat > tokens.env << 'TOKENS'
SLACK_BOT_TOKEN=your_xoxb_token_here
SLACK_APP_TOKEN=your_xapp_token_here
XAI_API_KEY=your_xai_key_here
PIXIO_API_KEY=your_pxio_key_here
TOKENS

# Start 24/7 (auto-restarts on crash)
nohup python3 EpicAgent_ULTIMATE.py > epic.log 2>&1 &

# Check it's running
ps aux | grep EpicAgent_ULTIMATE
```

### True 24/7 with Systemd (Survives Reboots)

```bash
# Install as systemd service (requires sudo)
sudo cp .kortix/systemd/epic-agent.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable epic-agent
sudo systemctl start epic-agent

# Control
sudo systemctl status epic-agent
sudo journalctl -u epic-agent -f
```

---

## Features

- ✅ 24/7 auto-restart operation
- ✅ Image generation (Pixio)
- ✅ Research, PDF/PPTX/DOCX creation
- ✅ Code execution
- ✅ Website builder
- ✅ Project management
- ✅ Deployment to GitHub, Vercel, Railway, Cloudflare
- ✅ Databases: Supabase, Neon, MongoDB, PlanetScale
- ✅ Full conversation memory + unlimited output

---

## Files

| File | Purpose |
|------|---------|
| `EpicAgent_ULTIMATE.py` | Main bot (all skills) |
| `GO_LIVE_24_7_NOW.sh` | One-command 24/7 launcher |
| `.kortix/systemd/` | Systemd service for permanent hosting |
| `SETUP_24_7.md` | Full 24/7 setup guide |

---

## Run Commands

```bash
# Start 24/7
nohup python3 EpicAgent_ULTIMATE.py > epic.log 2>&1 &

# Or use the helper
./GO_LIVE_24_7_NOW.sh

# Check status
ps aux | grep EpicAgent_ULTIMATE

# Live logs
tail -f epic.log
```

---

## Tokens Required

Create a `tokens.env` file:
```bash
SLACK_BOT_TOKEN=xoxb-...
SLACK_APP_TOKEN=xapp-...
XAI_API_KEY=xai-...
PIXIO_API_KEY=pxio_live_...
```

Or export them:
```bash
export SLACK_BOT_TOKEN="..."
export SLACK_APP_TOKEN="..."
export XAI_API_KEY="..."
export PIXIO_API_KEY="..."
```

---

## Stop

```bash
pkill -f EpicAgent_ULTIMATE.py
# or
kill $(cat epic_agent.pid)
```
