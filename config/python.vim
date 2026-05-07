" Python IDE configuration.

" NERDTree project drawer.
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 32

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
