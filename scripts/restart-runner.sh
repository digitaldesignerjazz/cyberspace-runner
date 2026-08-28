#!/usr/bin/env bash
# Stoppt und startet den Self-Hosted GitHub Actions Runner auf Hannover.
# Aufruf: sudo bash scripts/restart-runner.sh
set -euo pipefail

RUNNER_DIR="/opt/actions-runner"

if [ ! -d "$RUNNER_DIR" ]; then
  echo "Runner-Verzeichnis $RUNNER_DIR nicht gefunden." >&2
  exit 1
fi

cd "$RUNNER_DIR"

echo "Stoppe Runner-Dienst..."
sudo ./svc.sh stop || true

sleep 2

echo "Starte Runner-Dienst..."
sudo ./svc.sh start

echo "Runner neu gestartet."
