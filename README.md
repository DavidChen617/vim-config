# Vim Config

Personal Vim configuration managed as a Git repository.

## Layout

- `vimrc`: main entrypoint sourced by `~/.vimrc`
- `config/base.vim`: shared editor settings
- `config/python.vim`: Python IDE plugin settings and keymaps
- `ftplugin/python.vim`: Python-only indentation and buffer-local behavior
- `coc-settings.json`: coc.nvim language-server settings
- `templates/vimspector-python.json`: project debug template

## Python Features

- Syntax highlighting through Vim syntax/filetype support
- Completion, hover, diagnostics, rename, code actions and go-to-definition through `coc.nvim` and `coc-pyright`
- Project drawer through `NERDTree`
- Debug keymaps through `vimspector`

## Useful Keys

- `<Space>e`: toggle file tree
- `<Space>f`: reveal current file in tree
- `gd`: go to definition
- `gr`: references
- `K`: hover documentation
- `<Space>rn`: rename symbol
- `<Space>a`: code action
- `<Space>d`: diagnostics list
- `<Space>o`: outline
- `<Space>p`: format Python buffer
- `<Space>dd`: start debugger
- `<Space>db`: toggle breakpoint
