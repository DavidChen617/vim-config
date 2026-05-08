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

nnoremap <silent> gd :call CocJumpAndRefresh('jumpDefinition')<CR>
nnoremap <silent> gy :call CocJumpAndRefresh('jumpTypeDefinition')<CR>
nnoremap <silent> gi :call CocJumpAndRefresh('jumpImplementation')<CR>
nnoremap <silent> gr :call CocJumpAndRefresh('jumpReferences')<CR>
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>rn <Plug>(coc-rename)
nnoremap <silent> <leader>a <Plug>(coc-codeaction)
nnoremap <silent> <leader>d :CocList diagnostics<CR>
nnoremap <silent> <leader>o :CocList outline<CR>
nnoremap <silent> <leader>s :CocList -I symbols<CR>

" Scroll coc.nvim floating windows such as hover, diagnostics and completion docs.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

function! ShowDocumentation() abort
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! CocJumpAndRefresh(action) abort
  try
    let l:jumped = CocAction(a:action)
  catch
    echohl WarningMsg
    if v:exception =~# 'provider not found'
      echom 'Coc provider not available for this buffer.'
    else
      echom 'Coc jump failed: ' . v:exception
    endif
    echohl None
    return
  endtry

  redraw!
endfunction
