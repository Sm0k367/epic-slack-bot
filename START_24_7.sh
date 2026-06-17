#!/bin/bash
# One-command 24/7 launcher for Epic Agent Ultimate God Mode v6

echo "🚀 Starting Epic Agent Ultimate God Mode v6 for 24/7 operation..."

pkill -f EpicAgent_ULTIMATE.py 2>/dev/null || true
sleep 2

nohup python3 /workspace/EpicAgent_ULTIMATE.py > /workspace/epic_ultimate.log 2>&1 &

echo $! > /workspace/epic_agent.pid

echo ""
echo "✅ Bot is now running 24/7"
echo "   PID: $(cat /workspace/epic_agent.pid)"
echo "   Log: tail -f /workspace/epic_ultimate.log"
echo ""
echo "To stop: kill \$(cat /workspace/epic_agent.pid)"
