# Why @Epic Agent is NOT replying automatically

## Current State
- ✅ Bot process is running (Socket Mode connected)
- ✅ Bot can send messages (via kslack or manually)
- ❌ Bot is **NOT receiving** `@Epic Agent` mention events
- ❌ Bot is **NOT auto-replying**

## Root Cause
**Event Subscriptions are not enabled** in your Slack App.

The Socket Mode connection is established, but Slack only sends `app_mention` and `message.im` events **after** you explicitly subscribe to them in the dashboard.

## Fix (do this now - 30 seconds)

1. Open: https://api.slack.com/apps/A0BAZL0LCBX/event-subscriptions

2. Toggle **Enable Events** → ON (if not already)

3. Scroll to **Subscribe to bot events** and add exactly these two:
   - `app_mention`
   - `message.im`

4. Click the green **Save Changes** button at the bottom

## After You Save
- Slack will start pushing mention events to your bot
- The running `EpicAgent.py` will immediately start replying with Grok AI
- No restart needed

## Verification
Once enabled, type in Slack:
```
@Epic Agent hello
```
The bot should reply within a few seconds with an AI-generated response.

---

**That's the only thing missing.** Everything else is wired up correctly.
