" Shared coc.nvim configuration for language servers.

" Keep Coc settings inside this Git repo.
let g:coc_config_home = g:vim_config_root

let g:coc_global_extensions = [
      \ 'coc-pyright',
      \ 'coc-omnisharp',
      \ 'coc-json',
      \ 'coc-snippets',
      \ ]

" Completion and diagnostics through coc.nvim.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>rn <Plug>(coc-rename)
nnoremap <silent> <leader>a <Plug>(coc-codeaction)
nnoremap <silent> <leader>d :CocList diagnostics<CR>
nnoremap <silent> <leader>o :CocList outline<CR>
nnoremap <silent> <leader>s :CocList -I symbols<CR>

function! ShowDocumentation() abort
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
