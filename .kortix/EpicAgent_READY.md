# Epic Agent - Ready with Auto-Join

## Changes Made
✅ Added `conversations_join` on startup so the bot automatically joins `#all-epic-tech`

## Run Command
```bash
python3 /workspace/EpicAgent.py
```

## What Happens on Start
1. Connects via Socket Mode
2. Auto-joins channel C0BBWQVUAQ0 (#all-epic-tech)
3. Starts listening for @mentions and DMs
4. Uses Grok AI for all responses

## One-Time Setup (in Slack App Dashboard)
Go to https://api.slack.com/apps/A0BAZL0LCBX/event-subscriptions and:
- Enable Events
- Subscribe to: `app_mention` + `message.im`
- Save

After that the bot will respond to mentions in Slack.
