#!/bin/bash
set -euo pipefail

LOCAL_MASTER=$(git branch --list master)
# Use local master if it exists, otherwise
MASTER=master
if [[ -z ${LOCAL_MASTER} ]]; then
  MASTER=origin/master
fi
# Only check paths changed on branch to avoid excessive output.
export REMARK_PATHS=$(git diff --diff-filter=AM --name-only "${MASTER}" | grep '^docs')

if [[ -n "${REVIEWDOG_GITHUB_API_TOKEN:-}" ]]; then
  remark --rc-path=/usr/src/remarkrc.suggestion --no-color ${REMARK_PATHS} 2>&1 >/dev/null |
    reviewdog -f=remark-lint \
      -name="remark-lint" \
      -fail-on-error="false" \
      -level="info" \
      -tee

  remark --rc-path=/usr/src/remarkrc.problem --no-color ${REMARK_PATHS} 2>&1 >/dev/null |
    reviewdog -f=remark-lint \
      -name="remark-lint" \
      -fail-on-error="true" \
      -level="error" \
      -tee
else
  remark --quiet --rc-path=/usr/src/remarkrc.suggestion ${REMARK_PATHS} 2>&1 >/dev/null |
    sed -e 's/warning/suggestion/g'
  remark --frail --quiet --rc-path=/usr/src/remarkrc.problem ${REMARK_PATHS} 2>&1 >/dev/null |
    sed -e 's/warning/problem/g'
fi
