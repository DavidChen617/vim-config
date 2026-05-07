#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pack_dir="$root/pack/codex/start"

mkdir -p "$pack_dir"

clone_plugin() {
  local name="$1"
  local repo="$2"
  local branch="${3:-}"
  local target="$pack_dir/$name"

  if [ -d "$target/.git" ]; then
    git -C "$target" pull --ff-only
    return
  fi

  if [ -n "$branch" ]; then
    git clone --depth 1 --branch "$branch" "$repo" "$target"
  else
    git clone --depth 1 "$repo" "$target"
  fi
}

clone_plugin coc.nvim https://github.com/neoclide/coc.nvim.git release
clone_plugin nerdtree https://github.com/preservim/nerdtree.git
clone_plugin nerdtree-git-plugin https://github.com/Xuyuanp/nerdtree-git-plugin.git
clone_plugin vimspector https://github.com/puremourning/vimspector.git
clone_plugin vim-fugitive https://github.com/tpope/vim-fugitive.git

mkdir -p "$HOME/.config/coc/extensions"
npm install --prefix "$HOME/.config/coc/extensions" coc-pyright coc-json coc-snippets

python3 "$pack_dir/vimspector/install_gadget.py" --enable-python
