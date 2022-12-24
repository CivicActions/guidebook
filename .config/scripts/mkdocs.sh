#!/bin/bash
set -euo pipefail

# Move all files to a .docs directory, so we don't include the site directory.
# Build to a temporary directory to avoid permissions issues.
# Exclude info log messages for more concise output.

tmp_dir=$(mktemp -d -t mkdocs-XXXXXX)
function finish {
  # Cleanup code here
  rm -rf .docs "${tmp_dir}"
  echo "cleaned up"
}
trap finish EXIT

mkdir -p .docs
cp -R ./* .docs
/usr/bin/mkdocs build --config-file=.config/mkdocs.yml --strict --site-dir "${tmp_dir}" 2>&1 | { grep -v '^INFO' || true; }
echo "mkdocs build successful"
