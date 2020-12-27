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
 Plug 'zah/nim.vim'
 Plug 'LnL7/vim-nix'
call plug#end()

filetype plugin indent on
set clipboard+=unnamedplus

map <silent><M-g> :Goyo <CR>
map <silent><M-G> :GitGutterToggle <CR>

map <F4> :w <CR> :!xelatex % && zathura %<.pdf&<CR><CR>
map <leader>ll :w <CR> :!xelatex -shell-escape % <CR>

map <F8> :w <CR> :!g++ % -o %< && ./%< <CR>

map <silent> <C-h> :noh <CR>

nnoremap <backspace> :<backspace>

nnoremap <silent><leader>aa :ALEToggle<CR>

command! WQ wq
command! Wq wq
command! W w
command! Q q

autocmd BufNewFile *tex 0r ~/.config/nvim/templates/temp.tex
autocmd FileType c setlocal noet tw=80
autocmd FileType h setlocal noet tw=80
autocmd FileType help setlocal laststatus=0

autocmd FileType scheme
    \ let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '```':'```', '"""':'"""', "'''":"'''", "`":"`"} |
    \ execute "syntax keyword scmLambda lambda conceal cchar=λ"

autocmd FileType haskell
    \ execute "syntax match haskLambda /\\\\/ conceal cchar=λ"

autocmd FileType ocaml
    \ execute "syntax keyword mlLambda fun conceal cchar=λ"

set nosol
set conceallevel=2
set path=$PWD/**
set wildmenu
set laststatus=2
set splitright
set tabstop=4
set noruler
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
set smartcase
set guicursor=
set bg=dark
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,
set wildignore+=*.flac,*.mp3

colo rein

" statusline stuff
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
set statusline+=%3*\ %{&filetype}

hi link User1 User
hi link User2 String
hi link User3 User2
hi link User4 Comment

hi EndOfbuffer ctermfg=0 ctermbg=0

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
let g:gitgutter_enabled = 0

let g:user_emmet_leader_key='<C-z>'

let g:ale_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '×'
let g:ale_sign_warning = '!'

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
