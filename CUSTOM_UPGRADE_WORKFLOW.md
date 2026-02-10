# Custom Upgrade Workflow (Kimi Fork)

This repo is set up so you can keep custom features while pulling official updates.

## Branch roles

- `main`: mirror of upstream official `openclaw/openclaw:main`
- `dev/kimi-initial-setup`: your active custom development branch
- `custom/kimi-progress-watchdog`: snapshot branch focused on progress-report customizations
- `release/local-custom`: stable branch you can install/run locally

## Recommended routine

### 1) Pull latest official updates into your custom branch

```bash
pnpm run local:sync-upstream
```

Equivalent script:

```bash
bash scripts/sync-upstream-keep-custom.sh
```

This does:

1. `git fetch upstream` / `git fetch origin`
2. Fast-forward local `main` from `upstream/main`
3. Push updated `main` to your `origin`
4. Merge `main` into your custom branch (`dev/kimi-initial-setup` by default)
5. Push custom branch

### 2) Rebuild and apply locally

```bash
pnpm run local:rebuild-install
```

## If merge conflicts appear

Conflicts are expected when upstream edits the same files as your custom features.
Resolve conflicts, then:

```bash
git add -A
git commit
git push
```

Then rebuild locally.
