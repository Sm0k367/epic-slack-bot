#!/bin/bash
# Epic Agent Ultimate God Mode v6 - 24/7 Runner
# This script keeps the bot running forever with auto-restart

LOGFILE="/workspace/epic_ultimate.log"
PIDFILE="/workspace/epic_agent.pid"

echo "🚀 Starting Epic Agent Ultimate God Mode v6 (24/7 mode)..."

# Kill any existing instance
if [ -f "$PIDFILE" ]; then
    OLD_PID=$(cat "$PIDFILE")
    if ps -p $OLD_PID > /dev/null 2>&1; then
        echo "Killing existing bot (PID: $OLD_PID)..."
        kill $OLD_PID 2>/dev/null
        sleep 2
    fi
    rm -f "$PIDFILE"
fi

# Start the bot in background with auto-restart loop
(
    while true; do
        echo "[$(date)] Starting Epic Agent..." >> "$LOGFILE"
        python3 /workspace/EpicAgent_ULTIMATE.py >> "$LOGFILE" 2>&1
        EXIT_CODE=$?
        echo "[$(date)] Bot exited with code $EXIT_CODE. Restarting in 5 seconds..." >> "$LOGFILE"
        sleep 5
    done
) &

NEW_PID=$!
echo $NEW_PID > "$PIDFILE"
echo "✅ Epic Agent started in background (PID: $NEW_PID)"
echo "📜 Log file: $LOGFILE"
echo ""
echo "Useful commands:"
echo "  tail -f $LOGFILE           # Watch live logs"
echo "  cat $PIDFILE               # See current PID"
echo "  kill \$(cat $PIDFILE)      # Stop the bot"
echo ""
echo "Bot will auto-restart on crash and keep running until you kill it."
