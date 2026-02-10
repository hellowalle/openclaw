#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$REPO_ROOT"

echo "[1/5] Installing dependencies..."
pnpm install

echo "[2/5] Building OpenClaw..."
pnpm build

echo "[3/5] Installing this repo globally..."
npm i -g "$REPO_ROOT"

echo "[4/5] Restarting gateway..."
openclaw gateway restart || true

echo "[5/5] Gateway status..."
openclaw gateway status || true

echo "Done. Local OpenClaw build installed from: $REPO_ROOT"
