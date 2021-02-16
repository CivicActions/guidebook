#!/bin/bash
set -euo pipefail

tmp_dir=$(mktemp -d -t mkdocs-XXXXXX)
/usr/bin/mkdocs build --strict --site-dir "${tmp_dir}"
rm -rf "${tmp_dir}"
