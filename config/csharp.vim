" C# IDE configuration.

augroup csharp_coc_actions
  autocmd!
  autocmd FileType cs nnoremap <buffer><silent> <leader>p :call CocActionAsync('format')<CR>
augroup END

augroup csharp_dotnet_commands
  autocmd!
  autocmd FileType cs nnoremap <buffer><silent> <leader>cb :DotnetBuild<CR>
  autocmd FileType cs nnoremap <buffer><silent> <leader>ct :DotnetTest<CR>
  autocmd FileType cs nnoremap <buffer><silent> <leader>cr :DotnetRun<CR>
augroup END

command! DotnetBuild execute 'botright 12split | terminal dotnet build'
command! DotnetTest execute 'botright 12split | terminal dotnet test'
command! DotnetRun execute 'botright 12split | terminal dotnet run'
