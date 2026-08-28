#!/usr/bin/env bash
# Registriert den Cyberspace-Runner auf Repo-Ebene (digitaldesignerjazz/cyberspace-runner).
# Labels: self-hosted, linux, x64, lumina, hannover, cyberspace
set -euo pipefail

REPO="digitaldesignerjazz/cyberspace-runner"
RUNNER_DIR="/opt/actions-runner"

cd "$RUNNER_DIR"
sudo ./svc.sh stop || true

TOKEN=$(gh api -X POST "repos/${REPO}/actions/runners/registration-token" --jq .token)

sudo ./config.sh --url "https://github.com/${REPO}" \
  --token "$TOKEN" \
  --name cyberspace \
  --labels self-hosted,linux,x64,lumina,hannover,cyberspace \
  --unattended

sudo ./svc.sh install
sudo ./svc.sh start

echo "Runner cyberspace registriert und gestartet auf ${REPO}."
