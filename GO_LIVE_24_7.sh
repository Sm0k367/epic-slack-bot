#!/bin/bash
pkill -f EpicAgent_ULTIMATE 2>/dev/null || true
sleep 1
(
    while true; do
        python3 /workspace/EpicAgent_ULTIMATE.py >> /workspace/epic_ultimate.log 2>&1
        sleep 5
    done
) &
echo $! > /workspace/epic_agent.pid
echo "✅ Epic Agent Ultimate is now LIVE 24/7 (PID: $(cat /workspace/epic_agent.pid))"
echo "   Logs: tail -f /workspace/epic_ultimate.log"
