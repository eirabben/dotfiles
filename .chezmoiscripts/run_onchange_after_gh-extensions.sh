#!/usr/bin/env bash

# Installs gh CLI extensions. chezmoi re-runs this whenever the list below
# changes. topgrade keeps them updated.

set -euo pipefail

extensions=(
	dlvhdr/gh-dash
)

if ! command -v gh >/dev/null 2>&1; then
	echo "gh not found — skipping gh extensions. It is installed by the Brewfile."
	exit 0
fi

if ! gh auth status >/dev/null 2>&1; then
	echo "gh is not logged in — skipping gh extensions. After 'gh auth login', install them with:"
	printf '  gh extension install %s\n' "${extensions[@]}"
	exit 0
fi

installed=$(gh extension list | cut -f2)
for extension in "${extensions[@]}"; do
	if ! grep -qx "$extension" <<<"$installed"; then
		gh extension install "$extension"
	fi
done
