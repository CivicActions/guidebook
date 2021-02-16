#!/bin/bash
set -euo pipefail

# Build to a temporary directory to avoid permissions issues.
# Exclude info log messages for more concise output.

tmp_dir=$(mktemp -d -t mkdocs-XXXXXX)
/usr/bin/mkdocs build --strict --site-dir "${tmp_dir}" 2>&1 | grep -v '^INFO'
rm -rf "${tmp_dir}"
