# Vim Config

Personal Vim configuration managed as a Git repository.

## Layout

- `vimrc`: main entrypoint sourced by `~/.vimrc`
- `config/base.vim`: shared editor settings
- `config/coc.vim`: shared language-server keymaps and Coc extensions
- `config/python.vim`: Python IDE plugin settings and keymaps
- `config/csharp.vim`: C# IDE commands and keymaps
- `ftplugin/python.vim`: Python-only indentation and buffer-local behavior
- `ftplugin/cs.vim`: C#-only indentation and buffer-local behavior
- `coc-settings.json`: coc.nvim language-server settings
- `templates/vimspector-python.json`: project debug template

## Python Features

- Syntax highlighting through Vim syntax/filetype support
- Completion, hover, diagnostics, rename, code actions and go-to-definition through `coc.nvim` and `coc-pyright`
- Formatting through `black`
- Project drawer through `NERDTree`
- Debug keymaps through `vimspector`

## C# Features

- Completion, hover, diagnostics, rename, code actions and go-to-definition through `coc.nvim` and `coc-omnisharp`
- Formatting through OmniSharp/Coc
- Project commands through `dotnet`

Useful C# keys:

- `<Space>cb`: `dotnet build`
- `<Space>ct`: `dotnet test`
- `<Space>cr`: `dotnet run`
- `<Space>p`: format C# buffer

## System Requirements

Install Black for Python formatting:

```sh
sudo apt-get install black
```

C# support expects the .NET SDK and a solution file:

```sh
dotnet --info
dotnet new sln
dotnet sln add path/to/project.csproj
```

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
