#!/usr/bin/env bash
set -euo pipefail

grep -qxF 'source ~/vim-config/vimrc' ~/.vimrc 2>/dev/null || \
  echo 'source ~/vim-config/vimrc' >> ~/.vimrc

"$(dirname "${BASH_SOURCE[0]}")/install-plugins.sh"
