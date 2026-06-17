# Epic Agent Ultimate v6

Full-featured Slack bot with every skill from Kortix + Machine v12.

## Features

- 24/7 auto-restart operation
- Image generation via Pixio
- Research, PDF/PPTX/DOCX creation
- Code execution
- Website builder
- Project management
- Deployment to GitHub, Vercel, Railway, Cloudflare
- Database setup (Supabase, Neon, MongoDB, PlanetScale)
- Full conversation memory + unlimited output

## Quick Start (24/7)

```bash
# 1. Set your tokens
export SLACK_BOT_TOKEN="xoxb-..."
export SLACK_APP_TOKEN="xapp-..."
export XAI_API_KEY="xai-..."
export PIXIO_API_KEY="pxio_live_..."

# 2. Run forever (auto-restarts on crash)
nohup python3 EpicAgent_ULTIMATE.py > epic.log 2>&1 &

# Or use the helper
./GO_LIVE_24_7.sh
```

## Files

- `EpicAgent_ULTIMATE.py` — Main bot (clean, env-based tokens)
- `GO_LIVE_24_7.sh` — One-command 24/7 launcher
- `.kortix/` — Full documentation + systemd service

## GitHub

https://github.com/Sm0k367/epic-slack-bot
