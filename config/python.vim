" Python IDE configuration.

" Keep Coc settings inside this Git repo.
let g:coc_config_home = g:vim_config_root

" coc.nvim extensions are installed by Coc when network access is available.
let g:coc_global_extensions = [
      \ 'coc-pyright',
      \ 'coc-json',
      \ 'coc-snippets',
      \ ]

" NERDTree project drawer.
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 32

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

augroup python_coc_format
  autocmd!
  autocmd FileType python nnoremap <buffer><silent> <leader>p :call CocActionAsync('format')<CR>
augroup END

" Debug support through vimspector, when the plugin and debugpy gadget are installed.
let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <silent> <leader>dd :call vimspector#Launch()<CR>
nnoremap <silent> <leader>de :VimspectorReset<CR>
nnoremap <silent> <leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <leader>dc :call vimspector#Continue()<CR>
nnoremap <silent> <leader>dn :call vimspector#StepOver()<CR>
nnoremap <silent> <leader>di :call vimspector#StepInto()<CR>
nnoremap <silent> <leader>do :call vimspector#StepOut()<CR>
