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

# Make all files available in a .docs directory so we can build outside the root.
if [ ! -e .docs ]; then
  # Check if we are running on MacOS:
  if [[ "$(uname)" == "Darwin" ]]; then
    # On MacOS we rsync the files in, as symlinks can cause recursion issues.
    # if .docs exists but is a symlink, remove it first
    if [ -L .docs ]; then
      rm .docs
    fi
    rsync -avq --delete --exclude='/.docs' ./ .docs/
  else
    ln -s . .docs
  fi
fi

# Install packages.
poetry -C .config/mkdocs/ --quiet --no-root install

# Get config file path
CONFIG=$(realpath .config/mkdocs.yml)

# If a "serve" argument present then run the dev server, otherwise just do a strict test build.
if [[ "${1:-}" == "serve" ]]; then
  poetry -C .config/mkdocs/ run mkdocs $@ --config-file="${CONFIG}"
else
  poetry -C .config/mkdocs/ run mkdocs build --strict --config-file="${CONFIG}" --site-dir "${tmp_dir}"
  echo "mkdocs build successful" 1>&2
fi
