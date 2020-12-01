syntax on

call plug#begin('~/.config/nvim/plugged')
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-commentary'
 Plug 'jiangmiao/auto-pairs'
 Plug 'junegunn/goyo.vim'
 Plug 'mattn/emmet-vim'
 Plug 'godlygeek/tabular'
 Plug 'dense-analysis/ale'
 Plug 'tpope/vim-rsi'
 Plug 'nydyrd/rein.vim'

 Plug 'neovimhaskell/haskell-vim'
 Plug 'plasticboy/vim-markdown'
 Plug 'lluchs/vim-wren'
 Plug 'zah/nim.vim'
 Plug 'LnL7/vim-nix'
call plug#end()

filetype plugin indent on
set clipboard+=unnamedplus

imap <silent> <F3> <C-R>=strftime("%d/%m/%Y, %a %I:%M %p")<CR>

map <silent> <C-x> :vnew <bar> :terminal <CR>A

nnoremap ff :find<space>

map <C-r> :%s/

map <silent><M-g> :Goyo <CR>
map <silent><M-G> :GitGutterToggle <CR>

map <F4> :w <CR> :!xelatex % && zathura %<.pdf&<CR><CR>
map <leader>ll :w <CR> :!xelatex % <CR>

tnoremap <Esc> <C-\><C-n>

tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-u> <C-\><C-N><C-w>h
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

inoremap <C-y> <C-\><C-n><C-w>h
inoremap <C-j> <C-\><C-n><C-w>j
inoremap <C-k> <C-\><C-n><C-w>k
inoremap <C-l> <C-\><C-n><C-w>l

nnoremap <C-y> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <F8> :w <CR> :!g++ % -o %< && ./%< <CR>

map <silent> <C-h> :noh <CR>

nnoremap <backspace> :<backspace>

command! WQ wq
command! Wq wq
command! W w
command! Q q

autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/temp.tex
autocmd FileType c setlocal noet tw=80
autocmd FileType h setlocal noet tw=80

set nosol
set conceallevel=2
set path=$PWD/**
set wildmenu
set laststatus=0
set splitright
set tabstop=4
set noruler
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
set smartcase
set guicursor=
colo rein

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunc

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunc

set statusline=
set statusline+=%2*\%{StatuslineGit()}
set statusline+=%4*\%f
set statusline+=%=
set statusline+=%4*\ %l
set statusline+=%2*\ %{&filetype}

hi link User1 User
hi link User2 Normal
hi link User3 String
hi link User4 Folded

cabbrev he tab help
iabbrev #i #include
iabbrev #d #define

let g:tex_flavor = "latex"
let g:goyo_width  =  90
let g:goyo_height =  115

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '>'

let g:user_emmet_leader_key='<C-z>'

let g:ale_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '×'
let g:ale_sign_warning = '!'

let g:ghcid_command = 'stack exec ghcid --'

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
