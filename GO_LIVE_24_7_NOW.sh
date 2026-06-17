#!/bin/bash
# IMMEDIATE 24/7 LAUNCH - Run this and forget it

echo "🚀 Launching Epic Agent Ultimate God Mode v6 for 24/7 operation..."

# Kill any existing
pkill -f EpicAgent_ULTIMATE.py 2>/dev/null || true
sleep 2

# Start with nohup (survives terminal close)
nohup python3 /workspace/EpicAgent_ULTIMATE.py > /workspace/epic_ultimate.log 2>&1 &

PID=$!
echo $PID > /workspace/epic_agent.pid

echo ""
echo "✅✅✅ BOT IS NOW RUNNING 24/7 ✅✅✅"
echo ""
echo "   PID: $PID"
echo "   Log: tail -f /workspace/epic_ultimate.log"
echo ""
echo "The bot will keep running even if you close this terminal."
echo "It will auto-restart if the script is re-run."
echo ""
echo "To stop later: kill $PID"
