#!/bin/bash
# ONE-COMMAND 24/7 BOT LAUNCHER
# Run this once and the bot runs forever with auto-restart

echo "🚀 Launching Epic Agent Ultimate God Mode v6 for 24/7 operation..."

# Kill any existing
pkill -f EpicAgent_ULTIMATE.py 2>/dev/null || true
sleep 2

# Start with auto-restart loop in background
(
    while true; do
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting bot..." >> /workspace/epic_ultimate.log
        python3 /workspace/EpicAgent_ULTIMATE.py >> /workspace/epic_ultimate.log 2>&1
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Bot crashed/exited. Restarting in 5s..." >> /workspace/epic_ultimate.log
        sleep 5
    done
) &

echo $! > /workspace/epic_agent.pid

echo ""
echo "✅ Bot is now running 24/7 with auto-restart"
echo "   PID: $(cat /workspace/epic_agent.pid)"
echo "   Log: tail -f /workspace/epic_ultimate.log"
echo ""
echo "To stop: kill \$(cat /workspace/epic_agent.pid)"
echo ""
echo "Bot will survive terminal closes, crashes, and keep running until manually stopped."
