#!/usr/bin/env bash
set -euo pipefail

# Keeps your custom branch while ingesting latest upstream changes.
# Usage:
#   bash scripts/sync-upstream-keep-custom.sh [custom-branch]
# Default custom branch: dev/kimi-initial-setup

CUSTOM_BRANCH="${1:-dev/kimi-initial-setup}"
BASE_BRANCH="main"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

echo "[1/6] Fetching remotes..."
git fetch upstream
git fetch origin

echo "[2/6] Updating local ${BASE_BRANCH} from upstream/main..."
git checkout "$BASE_BRANCH"
git merge --ff-only upstream/main

echo "[3/6] Pushing updated ${BASE_BRANCH} to origin..."
git push origin "$BASE_BRANCH"

echo "[4/6] Merging ${BASE_BRANCH} into ${CUSTOM_BRANCH}..."
git checkout "$CUSTOM_BRANCH"
git merge "$BASE_BRANCH"

echo "[5/6] Pushing ${CUSTOM_BRANCH}..."
git push origin "$CUSTOM_BRANCH"

echo "[6/6] Done."
echo "Tip: run 'pnpm run local:rebuild-install' to rebuild and apply locally."
