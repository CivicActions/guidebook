#!/bin/bash
set -euo pipefail

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -n "${GITHUB_WORKSPACE:-}" ]]; then
  # Add global git config entry for GITHUB_WORKSPACE as a safe.directory.
  git config --global --add safe.directory "$GITHUB_WORKSPACE"
fi

# Add node_modules/.bin to PATH so we can find remark
export PATH="${SCRIPT_DIR}/node_modules/.bin:${PATH}"

remark --frail --quiet --rc-path="${SCRIPT_DIR}/remarkrc.problem" .
