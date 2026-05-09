" C IDE configuration.

augroup c_coc_actions
  autocmd!
  autocmd FileType c nnoremap <buffer><silent> <leader>p :call CocActionAsync('format')<CR>
augroup END

augroup c_build_commands
  autocmd!
  autocmd FileType c nnoremap <buffer><silent> <leader>cb :CBuild<CR>
  autocmd FileType c nnoremap <buffer><silent> <leader>cr :CRun<CR>
  autocmd FileType c nnoremap <buffer><silent> <leader>cR :CBuildRun<CR>
  autocmd FileType c nnoremap <buffer><silent> <leader>cv :CVimspectorTemplate<CR>
augroup END

function! COutputPath() abort
  return expand('%:p:r')
endfunction

function! CMakeAvailable() abort
  return filereadable(getcwd() . '/Makefile') || filereadable(getcwd() . '/makefile')
endfunction

function! CBuildCommand() abort
  if CMakeAvailable()
    return 'make'
  endif

  let l:source = shellescape(expand('%:p'))
  let l:output = shellescape(COutputPath())
  return 'gcc -g -Wall -Wextra -std=c11 ' . l:source . ' -o ' . l:output
endfunction

command! CBuild execute 'botright 12split | terminal ' . CBuildCommand()
command! CRun execute 'botright 12split | terminal ' . shellescape(COutputPath())
command! CBuildRun execute 'botright 12split | terminal ' . CBuildCommand() . ' && ' . shellescape(COutputPath())
command! CVimspectorTemplate execute '0read ' . fnameescape(g:vim_config_root . '/templates/vimspector-c.json')
