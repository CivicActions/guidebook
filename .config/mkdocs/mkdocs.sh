#!/bin/bash
set -euo pipefail

if [ -z "${GH_TOKEN:-}" ]; then
  echo "Github token for material-insiders access needed. Ask in #docs channel for access." 1>&2
  exit 1
fi
if ! gh --version &> /dev/null; then
  echo "Github CLI is required: https://cli.github.com/" 1>&2
  exit 2
fi
if ! poetry --version &> /dev/null; then
  echo "Poetry is required: https://python-poetry.org/" 1>&2
  exit 3
fi

# Register gh as a git credential helper, so we can use GH_TOKEN securely.
gh auth setup-git

# Build to a temporary directory to avoid permissions issues.
tmp_dir=$(mktemp -d -t mkdocs-XXXXXX)
function finish {
  # Cleanup code here
  rm -rf "${tmp_dir}"
}
trap finish EXIT

# Ensure we start in the git root directory.
cd "$(git rev-parse --show-toplevel)"

# Symlink all files to a .docs directory so we can build outside the root.
# We leave the symlink in place, in case the user needs to run mkdocs again locally.
ln -sfT . .docs

# Install packages.
poetry -C .config/mkdocs/ --quiet install

# Exclude info log messages for more concise output.
poetry -C .config/mkdocs/ run mkdocs build --config-file=.config/mkdocs.yml --strict --site-dir "${tmp_dir}" 2>&1 | { grep -v '^INFO' || true; }
echo "mkdocs build successful" 1>&2