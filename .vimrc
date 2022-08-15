call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.




Plug 'valloric/youcompleteme'
Plug 'vitalk/vim-shebang'
Plug 'sbdchd/vim-shebang'
Plug 'zxqfl/tabnine-vim'
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

"""""""""""""""""""""""""""""""""
"Plug 'sbdchd/vim-shebang'
let g:shebang#shebangs = {
            \ 'python': '#!/bin/python',
            \ 'sh': '',
            \ 'newfiletype': '#!/bin/newshebang'
            \ }
"""""""""""""""""""""""""""""""""



set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set nocursorcolumn nocursorline number shiftwidth=4 tabstop=4 expandtab scrolloff=10 nowrap incsearch ignorecase smartcase showcmd showmode showmatch hlsearch history=1000 wildmenu wildmode=list:longest wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
let mapleader = "\\"
nnoremap <leader>\ ``
nnoremap <silent> <leader>p :%w !lp<CR>
inoremap jj <Esc>
nnoremap <space> :
nnoremap o o<esc>
nnoremap O O<esc>
nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><
nnoremap <F3> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif
if has('gui_running')
    set background=dark
    colorscheme molokai
    " Syntax: <font_name>\ <weight>\ <size>
    set guifont=Monospace\ Regular\ 12
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=m
    set guioptions-=b
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>
endif
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2
set mouse=a splitbelow splitright
set encoding=UTF-8"
set number
syntax on
set termguicolors
set mouse=a
verbose set cmdheight=1
set splitbelow splitright
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
set wildmenu
set wildmode=longest:full,full
set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set backup
set backupdir=~/.vim/backup//
set writebackup
set backupcopy=yes
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

cnoreabbrev e  Edit
cnoreabbrev nu number

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

let s:comment_map = {"c": '\/\/', "cpp": '\/\/', "go": '\/\/', "java": '\/\/', "javascript": '\/\/', "lua": '--', "scala": '\/\/', "php": '\/\/', "python": '#', "ruby": '#', "rust": '\/\/', "sh": '#', "desktop": '#', "fstab": '#', "conf": '#', "profile": '#', "bashrc": '#', "bash_profile": '#', "mail": '>', "eml": '>', "bat": 'REM', "ahk": ';', "vim": '"', "tex": '%'}
function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " "
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction

""" ----------------------------SHORT-HEYS-FOR-NAVIGATING-THROUGHT-TABS-IN-VIM-------------------------------------------"
nnoremap <silent> <C-S-Left>   :tabprevious           <CR>
nnoremap <silent> <C-S-Right>  :tabnext               <CR>
nnoremap <silent> <C-S-J>      :tabprevious           <CR>
nnoremap <silent> <C-S-K>      :tabnext               <CR>
nnoremap <silent> <S-M-K>      :wincmd K              <CR>
nnoremap <silent> <S-M-J>      :wincmd J              <CR>
nnoremap <silent> <S-M-H>      :wincmd H              <CR>
nnoremap <silent> <S-M-L>      :wincmd L              <CR>
nnoremap <silent> <F2>         :term                  <CR>
nnoremap <silent> <C-_>        :call ToggleComment()  <CR>
" C-M-S-F1-A>

""" ----------------------------SHORT-HEYS-FOR-RUN-AND-COMPILE-CODES-ON-VIM----------------------------------------------
autocmd filetype c          nnoremap <C-c> :w <bar> !clear && gcc -std=c99 -lm % -o %:p:h/%:t:r.out && ./%:r.out     <CR>
autocmd filetype cpp        nnoremap <C-c> :w <bar> !clear && g++ -std=gnu++14 -O2 % -o %:p:h/%:t:r.exe && ./%:r.exe <CR>
autocmd filetype java       nnoremap <C-c> :w <bar> !clear && javac % && java -enableassertions %:p                  <CR>
autocmd filetype javascript nnoremap <C-c> :w <bar> !clear && node %                                                 <CR>
autocmd filetype python     nnoremap <C-c> :w <bar> !clear && python %                                               <CR>
autocmd filetype perl       nnoremap <C-c> :w <bar> !clear && perl %                                                 <CR>
autocmd filetype go         nnoremap <C-c> :w <bar> !clear && go build % && ./%:p                                    <CR>
autocmd filetype sh         nnoremap <C-c> :w <bar> !clear && bash %                                                 <CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :exec "vert term"|wincmd w
" :term
" :wincmd w
" :NERDTreeToggle
" :TagbarToggle
" :wincmd l
" :resize +20


