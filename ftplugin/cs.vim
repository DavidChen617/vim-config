" C#-local editor settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal autoindent
setlocal smartindent
setlocal textwidth=120
setlocal colorcolumn=120

setlocal makeprg=dotnet\ build

" Coc's coc-omnisharp extension only contributes *.sln roots. Include modern
" .slnx projects so workspace resolution starts at the project root.
let b:coc_root_patterns = ['*.sln', '*.slnx', '*.csproj', '.git']
