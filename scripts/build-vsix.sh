#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

if ! command -v pnpm >/dev/null 2>&1; then
	if command -v corepack >/dev/null 2>&1; then
		corepack enable
		corepack prepare pnpm@10.11.0 --activate
	else
		echo "pnpm not found and corepack is unavailable. Install pnpm or Node.js 20+ with corepack." >&2
		exit 1
	fi
fi

pnpm install
pnpm run generate
pnpm run build
pnpm run pack
