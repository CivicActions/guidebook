#!/bin/bash
set -euo pipefail

# Ensure we start in the git root directory.
cd "$(git rev-parse --show-toplevel)"

# Source an env file if it exists.
if [ -f .env ]; then
  source .env
fi

# Check environment.
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

# Symlink all files to a .docs directory so we can build outside the root.
# We leave the symlink in place, in case the user needs to run mkdocs again locally.
if [ ! -e .docs ]; then
  ln -s . .docs
fi

# Install packages.
poetry -C .config/mkdocs/ --quiet --no-root install

# If a "serve" argument present then run the dev server, otherwise just do a test build.
if [[ "${1:-}" == "serve" ]]; then
  poetry -C .config/mkdocs/ run mkdocs $@ --config-file=.config/mkdocs.yml
else
  # Exclude info log messages for more concise output.
  { poetry -C .config/mkdocs/ run mkdocs build --config-file=.config/mkdocs.yml --site-dir "${tmp_dir}" 2>&1 | grep -v '^INFO'; } || true
  # Exclude warning for files not added to git so local pre-commit hooks don't fail.
  warnings=$(grep -v 'has no git logs, using current timestamp' "${tmp_dir}/log.txt" | grep -c 'WARNING') || true
  if [ "${warnings}" -gt 0 ]; then
    echo "mkdocs build failed with ${warnings} warnings" 1>&2
    exit 4
  fi
  echo "mkdocs build successful" 1>&2
fi
