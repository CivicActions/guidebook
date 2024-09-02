#!/bin/bash

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

# Symlink all files to a .docs directory so we can build outside the root.
# We leave the symlink in place, in case the user needs to run mkdocs again locally.
if [ ! -e .docs ]; then
  ln -s . .docs
fi

# Install packages.
poetry -C .config/mkdocs/ --quiet install

material_insiders_repo="https://github.com/squidfunk/mkdocs-material-insiders.git"

# Get latest tag from material-insiders git repo.
# Got solution from https://stackoverflow.com/questions/29780641/how-to-clone-latest-tag-in-a-git-repo.
latest_tag=$(git ls-remote --tags --exit-code --refs "${material_insiders_repo}" \
  | sed -E 's/^[[:xdigit:]]+[[:space:]]+refs\/tags\/(.+)/\1/g' \
  | sort --version-sort | tail -n1)

echo $latest_tag

# Get latest installed tag from poetry.
installed_tag=$(poetry -C .config/mkdocs/ show mkdocs-material | awk '/version/ { print $3 }' | sed 's/+insiders./-insiders-/')

#echo $installed_tag

# Compare tags
if [ ! -z "$latest_tag" ]; then
  if [ "$latest_tag" = "$installed_tag" ]; then
    echo "Latest material-insiders version ${latest_tag} already installed."
  else
    echo "Newer material-insiders version available: ${latest_tag}. Installing..."
    poetry -C .config/mkdocs/ add git+${material_insiders_repo}#"${latest_tag}"
  fi
else
  echo "Check material insiders version script failed." 1>&2
  exit 4
fi
