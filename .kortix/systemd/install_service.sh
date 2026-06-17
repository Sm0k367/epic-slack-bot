#!/bin/bash
echo "Installing Epic Agent as systemd service..."
sudo cp /workspace/.kortix/systemd/epic-agent.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable epic-agent
sudo systemctl start epic-agent
echo "✅ Epic Agent installed as systemd service"
echo "Commands:"
echo "  sudo systemctl status epic-agent"
echo "  sudo systemctl restart epic-agent"
echo "  sudo journalctl -u epic-agent -f"
