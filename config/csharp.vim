" C# IDE configuration.

" OmniSharp-vim handles C# definition navigation, including metadata.
" Coc remains responsible for completion, diagnostics and formatting.
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_server_path = '/home/davidchen/.config/coc/extensions/coc-omnisharp-data/server/OmniSharp'
let g:OmniSharp_start_server = 1
let g:OmniSharp_lookup_metadata = 1
let g:OmniSharp_highlighting = 2
let g:OmniSharp_diagnostic_listen = 0
let g:OmniSharp_open_quickfix = 0
let g:OmniSharp_selector_ui = ''
let g:OmniSharp_loglevel = 'warning'
let g:OmniSharp_highlight_groups = {
      \ 'ClassName': 'Type',
      \ 'StructName': 'Type',
      \ 'InterfaceName': 'Include',
      \ 'EnumName': 'Structure',
      \ 'DelegateName': 'Function',
      \ 'MethodName': 'Function',
      \ 'ExtensionMethodName': 'Function',
      \ 'PropertyName': 'Identifier',
      \ 'FieldName': 'Identifier',
      \ 'NamespaceName': 'Include',
      \ 'ParameterName': 'Identifier',
      \ 'LocalName': 'Identifier',
      \ }

function! CsharpFindOmniSharpRoot(bufnr) abort
  let l:dir = fnamemodify(bufname(a:bufnr), ':p:h')
  let l:last = ''

  while l:dir !=# l:last
    let l:sln = globpath(l:dir, '*.sln', 0, 1)
    if !empty(l:sln)
      return l:sln[0]
    endif

    let l:slnx = globpath(l:dir, '*.slnx', 0, 1)
    if !empty(l:slnx)
      return l:dir
    endif

    let l:last = l:dir
    let l:dir = fnamemodify(l:dir, ':h')
  endwhile

  return ''
endfunction

let g:OmniSharp_find_solution = function('CsharpFindOmniSharpRoot')

augroup csharp_coc_actions
  autocmd!
  autocmd FileType cs nnoremap <buffer><silent> <leader>p :call CocActionAsync('format')<CR>
augroup END

augroup csharp_dotnet_commands
  autocmd!
  autocmd FileType cs nnoremap <buffer><silent> gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <buffer><silent> gy :OmniSharpGotoTypeDefinition<CR>
  autocmd FileType cs nnoremap <buffer><silent> <leader>cb :DotnetBuild<CR>
  autocmd FileType cs nnoremap <buffer><silent> <leader>ct :DotnetTest<CR>
  autocmd FileType cs nnoremap <buffer><silent> <leader>cr :DotnetRun<CR>
  autocmd FileType cs nnoremap <buffer><silent> <leader>cv :CsharpVimspectorTemplate<CR>
  autocmd FileType cs nnoremap <buffer><silent> <leader>cp :OmniSharpPreviewDefinition<CR>
augroup END

command! DotnetBuild execute 'botright 12split | terminal dotnet build'
command! DotnetTest execute 'botright 12split | terminal dotnet test'
command! DotnetRun execute 'botright 12split | terminal dotnet run'
command! CsharpVimspectorTemplate execute '0read ' . fnameescape(g:vim_config_root . '/templates/vimspector-csharp.json')
