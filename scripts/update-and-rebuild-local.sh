#!/usr/bin/env bash
set -euo pipefail

CUSTOM_BRANCH="${1:-dev/kimi-initial-setup}"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

echo "[A] Syncing upstream into ${CUSTOM_BRANCH}..."
bash scripts/sync-upstream-keep-custom.sh "$CUSTOM_BRANCH"

echo "[B] Rebuilding and installing local OpenClaw..."
bash scripts/rebuild-local-install.sh

echo "All done: upstream synced + local runtime rebuilt."
