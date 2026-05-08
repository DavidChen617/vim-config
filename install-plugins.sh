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
clone_plugin omnisharp-vim https://github.com/OmniSharp/omnisharp-vim.git

mkdir -p "$HOME/.config/coc/extensions"
npm install --prefix "$HOME/.config/coc/extensions" coc-pyright coc-omnisharp coc-json coc-snippets

# coc-pyright currently looks for pyright under its own extension directory.
# npm may flatten the dependency to the shared extensions node_modules folder.
mkdir -p "$HOME/.config/coc/extensions/node_modules/coc-pyright/node_modules"
ln -sfn ../../pyright "$HOME/.config/coc/extensions/node_modules/coc-pyright/node_modules/pyright"

if ! command -v black >/dev/null 2>&1; then
  printf '%s\n' 'warning: black is not installed. Install it with: sudo apt-get install black' >&2
fi

omnisharp_version="v1.39.15"
omnisharp_id="262348128"
omnisharp_url="https://github.com/OmniSharp/omnisharp-roslyn/releases/download/${omnisharp_version}/omnisharp-linux-x64-net6.0.zip"
omnisharp_data="$HOME/.config/coc/extensions/coc-omnisharp-data"
omnisharp_zip="$omnisharp_data/server-net6.zip"

if [ ! -x "$omnisharp_data/server/OmniSharp" ]; then
  mkdir -p "$omnisharp_data/server"
  curl -L "$omnisharp_url" -o "$omnisharp_zip"
  unzip -oq "$omnisharp_zip" -d "$omnisharp_data/server"
  chmod 755 "$omnisharp_data/server/OmniSharp"
  printf '{"url":"%s","version":"%s","id":%s,"downloadedTime":%s}\n' \
    "$omnisharp_url" "$omnisharp_version" "$omnisharp_id" "$(date +%s000)" \
    > "$omnisharp_data/downloadinfo.json"
fi

python3 "$pack_dir/vimspector/install_gadget.py" --enable-python --force-enable-csharp
