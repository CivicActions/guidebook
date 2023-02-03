#!/bin/bash
set -euo pipefail

if [[ -n "${GITHUB_WORKSPACE:-}" ]]; then
  # Add global git config entry for GITHUB_WORKSPACE as a safe.directory.
  git config --global --add safe.directory "$GITHUB_WORKSPACE"
fi

remark --frail --quiet --rc-path=/usr/src/remarkrc.problem .
