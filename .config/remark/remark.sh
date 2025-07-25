#!/bin/bash
set -euo pipefail

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -n "${GITHUB_WORKSPACE:-}" ]]; then
  # Add global git config entry for GITHUB_WORKSPACE as a safe.directory.
  git config --global --add safe.directory "$GITHUB_WORKSPACE"
fi

LOCAL_MASTER=$(git branch --list master)
# Use local master if it exists, otherwise
MASTER=master
if [[ -z ${LOCAL_MASTER} ]]; then
  MASTER=origin/master
fi
# Only check markdown files changed on branch to avoid excessive output.
REMARK_PATHS=""
REMARK_PATHS=$(git diff --diff-filter=AM --name-only "${MASTER}" ':*.md' | grep -vE '^[.]' || true)
export REMARK_PATHS

# Add node_modules/.bin to PATH so we can find remark
export PATH="${SCRIPT_DIR}/node_modules/.bin:${PATH}"

if [[ -z "${REMARK_PATHS}" ]]; then
  exit 0
fi
if [[ -n "${INPUT_GITHUB_TOKEN:-}" ]]; then
  export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

  # Capture remark suggestions output and count them
  REMARK_SUGGESTIONS_OUTPUT=$(remark --rc-path="${SCRIPT_DIR}/remarkrc.suggestion" --no-color ${REMARK_PATHS} 2>&1 >/dev/null)
  SUGGESTION_COUNT=$(echo "$REMARK_SUGGESTIONS_OUTPUT" | grep -c "warning" || true)

  # Only run reviewdog for suggestions if count is 10 or fewer
  if [[ $SUGGESTION_COUNT -le 10 ]]; then
    echo "$REMARK_SUGGESTIONS_OUTPUT" |
      reviewdog -f=remark-lint \
        -name="remark-lint-suggestions" \
        -reporter="github-pr-check" \
        -fail-on-error="false" \
        -level="info" \
        -tee
  else
    echo "Skipping reviewdog for suggestions: found $SUGGESTION_COUNT suggestions (>10 threshold)"
  fi

  remark --rc-path="${SCRIPT_DIR}/remarkrc.problem" --no-color ${REMARK_PATHS} 2>&1 >/dev/null |
    reviewdog -f=remark-lint \
      -name="remark-lint-problem" \
      -reporter="github-pr-check" \
      -fail-on-error="true" \
      -level="error" \
      -tee
else
  remark --quiet --rc-path="${SCRIPT_DIR}/remarkrc.suggestion" ${REMARK_PATHS} 2>&1 >/dev/null |
    sed -e 's/warning/suggestion/g'
  remark --frail --quiet --rc-path="${SCRIPT_DIR}/remarkrc.problem" ${REMARK_PATHS} 2>&1 >/dev/null |
    sed -e 's/warning/problem/g'
fi
