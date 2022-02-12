call plug#begin('~/.vim/plugged')
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'majutsushi/tagbar'
Plug 'endel/vim-github-colorscheme'
Plug 'ryanoasis/vim-devicons'
Plug 'zxqfl/tabnine-vim'
Plug 'vim-scripts/ctags.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'ekalinin/Dockerfile.vim'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'stephpy/vim-yaml'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/jsonc.vim'
" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'leafgarland/typescript-vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/unite.vim'
Plug 'turbio/bracey.vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'

" Plug 'ryanoasis/nerd-fonts'
" Plug 'ryanoasis/vim-devicons'


call plug#end()

let mapleader = ","
syntax on
set encoding=UTF-8
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set number ""relativenumber
set laststatus=2
set noshowmode
set updatetime=250
set nocompatible
set encoding=UTF-8
filetype plugin on

noremap <Leader>Y "+y
noremap <Leader>P "+p
nnoremap gb <C-O><C-S>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-E> <C-W><C-V>
nnoremap <C-O> <C-W><C-S>

autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

let g:python3_host_prog = '/usr/bin/python3.8'
let g:python_host_prog = '/usr/bin/python2.7'
let g:loaded_ruby_provider = 0
let g:floaterm_keymap_toggle = '<Leader>`'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*js,*jsx'
let g:ale_linters_explicit = 1
let g:gitgutter_realtime = 1
let g:rustfmt_autosave = 1
let g:vim_markdown_folding_disabled = 1
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'npx tsc'

"FZF RG
nnoremap <silent> <C-p> :FZF<CR>
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

"Challenger Deep
let g:challenger_deep_termcolors = 16
if has('nvim') || has('termguicolors')
    set termguicolors
endif
colorscheme challenger_deep

"Vim-Airline
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 0

"CoC
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set signcolumn=yes
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_user_config = 1
let g:coc_global_extensions = 1

nmap     <silent> [g <Plug>(coc-diagnostic-prev)
nmap     <silent> ]g <Plug>(coc-diagnostic-next)
nmap     <silent> gd <Plug>(coc-definition)
nmap     <silent> gy <Plug>(coc-type-definition)
nmap     <silent> gi <Plug>(coc-implementation)
nmap     <silent> gr <Plug>(coc-references)
nmap     <leader> rn <Plug>(coc-rename)
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

xmap <leader>a      <Plug>(coc-codeaction-selected)
nmap <leader>a      <Plug>(coc-codeaction-selected)
nmap <leader>ac     <Plug>(coc-codeaction)
nmap <leader>qf     <Plug>(coc-fix-current)
xmap if             <Plug>(coc-funcobj-i)
xmap af             <Plug>(coc-funcobj-a)
omap if             <Plug>(coc-funcobj-i)
omap af             <Plug>(coc-funcobj-a)
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <leader>f      <Plug>(coc-format-selected)
nmap <leader>f      <Plug>(coc-format-selected)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('patch8.1.1068')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"Goyo
let g:goyo_width = 150
nnoremap <Leader>gy :Goyo<CR>
function! s:goyo_enter()
    set number relativenumber
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()

"NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

"Jedi
let g:jedi#goto_definitions_command = "gd"
let g:jedi#rename_command = "<leader>rn"
"''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>

"TagbarToggle
"
"au BufEnter *.py :TagbarToggle<CR>
"au BufEnter *.* :TagbarToggle<CR>
" nmap <F8> :TagbarToggle<CR>
" nmap <F2> :set splitbelow | term <CR>

" set splitright
nmap <F2> :term <CR>
nmap <F3> :TagbarToggle<CR>
nmap <F4> :NERDTreeToggle<CR>
" nmap <F9> :w <CR> :!clear && gcc % <CR>
" nmap <C-F9> : w <CR> :!clear && gcc % -o %< && ./%< <CR>

map <F9> :w <CR> :!clear && gcc % <CR>
map <C-F9> :w <CR> :!clear && gcc % -o %< && ./%< <CR>


" autocmd VimEnter * TagbarToggle
autocmd VimEnter * NERDTreeToggle
set mouse=a
verbose set cmdheight=1
set splitbelow
set splitright



autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview





" nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>
" nnoremap <C-x> :!./%:r.out<Enter>
" noremap <C-c> :!clear && g++ -o %:r.out % -std=c++11<Enter>
" nnoremap <C-x> :!clear && ./%:r.out<Enter>
" noremap <C-x> :!clear && g++ -o %:r.out % -std=c++11 <Enter> && clear && ./%:r.out<Enter>


""" ----------------------------SHORT-HEYS-FOR-NAVIGATING-THROUGHT-TABS-IN-VIM---------------------------------------
nnoremap <C-Left>   :tabprevious <CR>
nnoremap <C-Right>  :tabnext     <CR>
nnoremap <C-j>      :tabprevious <CR>
nnoremap <C-k>      :tabnext     <CR>

""" ----------------------------SHORT-HEYS-FOR-RUN-AND-COMPILE-CODES-ON-VIM------------------------------------------
autocmd filetype cpp        nnoremap <C-c> :w <bar> !clear && g++ -std=gnu++14 -O2 % -o %:p:h/%:t:r.exe && ./%:r.exe <CR>
autocmd filetype c          nnoremap <C-c> :w <bar> !clear && gcc -std=c99 -lm % -o %:p:h/%:t:r.out && ./%:r.out     <CR>
autocmd filetype java       nnoremap <C-c> :w <bar> !clear && javac % && java -enableassertions %:p                  <CR>
autocmd filetype python     nnoremap <C-c> :w <bar> !clear && python3 %                                              <CR>
autocmd filetype javascript nnoremap <C-c> :w <bar> !clear && node %                                                 <CR>
autocmd filetype perl       nnoremap <C-c> :w <bar> !clear && perl %                                                 <CR>
autocmd filetype go         nnoremap <C-c> :w <bar> !clear && go build % && ./%:p                                    <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
"""""" unicode characters in the file autoload/float.vim
"""""set encoding=utf-8
"""""
"""""" TextEdit might fail if hidden is not set.
"""""set hidden
"""""
"""""" Some servers have issues with backup files, see #649.
"""""set nobackup
"""""set nowritebackup
"""""
"""""" Give more space for displaying messages.
"""""set cmdheight=2
"""""
"""""" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"""""" delays and poor user experience.
"""""set updatetime=300
"""""
"""""" Don't pass messages to |ins-completion-menu|.
"""""set shortmess+=c
"""""
"""""" Always show the signcolumn, otherwise it would shift the text each time
"""""" diagnostics appear/become resolved.
"""""if has("nvim-0.5.0") || has("patch-8.1.1564")
"""""  " Recently vim can merge signcolumn and number column into one
"""""  set signcolumn=number
"""""else
"""""  set signcolumn=yes
"""""endif
"""""
"""""" Use tab for trigger completion with characters ahead and navigate.
"""""" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"""""" other plugin before putting this into your config.
"""""inoremap <silent><expr> <TAB>
"""""      \ pumvisible() ? "\<C-n>" :
"""""      \ <SID>check_back_space() ? "\<TAB>" :
"""""      \ coc#refresh()
"""""inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"""""
"""""function! s:check_back_space() abort
"""""  let col = col('.') - 1
"""""  return !col || getline('.')[col - 1]  =~# '\s'
"""""endfunction
"""""
"""""" Use <c-space> to trigger completion.
"""""if has('nvim')
"""""  inoremap <silent><expr> <c-space> coc#refresh()
"""""else
"""""  inoremap <silent><expr> <c-@> coc#refresh()
"""""endif
"""""
"""""" Make <CR> auto-select the first completion item and notify coc.nvim to
"""""" format on enter, <cr> could be remapped by other vim plugin
"""""inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"""""                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"""""
"""""" Use `[g` and `]g` to navigate diagnostics
"""""" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"""""nmap <silent> [g <Plug>(coc-diagnostic-prev)
"""""nmap <silent> ]g <Plug>(coc-diagnostic-next)
"""""
"""""" GoTo code navigation.
"""""nmap <silent> gd <Plug>(coc-definition)
"""""nmap <silent> gy <Plug>(coc-type-definition)
"""""nmap <silent> gi <Plug>(coc-implementation)
"""""nmap <silent> gr <Plug>(coc-references)
"""""
"""""" Use K to show documentation in preview window.
"""""nnoremap <silent> K :call <SID>show_documentation()<CR>
"""""
"""""function! s:show_documentation()
"""""  if (index(['vim','help'], &filetype) >= 0)
"""""    execute 'h '.expand('<cword>')
"""""  elseif (coc#rpc#ready())
"""""    call CocActionAsync('doHover')
"""""  else
"""""    execute '!' . &keywordprg . " " . expand('<cword>')
"""""  endif
"""""endfunction
"""""
"""""" Highlight the symbol and its references when holding the cursor.
"""""autocmd CursorHold * silent call CocActionAsync('highlight')
"""""
"""""" Symbol renaming.
"""""nmap <leader>rn <Plug>(coc-rename)
"""""
"""""" Formatting selected code.
"""""xmap <leader>f  <Plug>(coc-format-selected)
"""""nmap <leader>f  <Plug>(coc-format-selected)
"""""
"""""augroup mygroup
"""""  autocmd!
"""""  " Setup formatexpr specified filetype(s).
"""""  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"""""  " Update signature help on jump placeholder.
"""""  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"""""augroup end
"""""
"""""" Applying codeAction to the selected region.
"""""" Example: `<leader>aap` for current paragraph
"""""xmap <leader>a  <Plug>(coc-codeaction-selected)
"""""nmap <leader>a  <Plug>(coc-codeaction-selected)
"""""
"""""" Remap keys for applying codeAction to the current buffer.
"""""nmap <leader>ac  <Plug>(coc-codeaction)
"""""" Apply AutoFix to problem on the current line.
"""""nmap <leader>qf  <Plug>(coc-fix-current)
"""""
"""""" Run the Code Lens action on the current line.
"""""nmap <leader>cl  <Plug>(coc-codelens-action)
"""""
"""""" Map function and class text objects
"""""" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"""""xmap if <Plug>(coc-funcobj-i)
"""""omap if <Plug>(coc-funcobj-i)
"""""xmap af <Plug>(coc-funcobj-a)
"""""omap af <Plug>(coc-funcobj-a)
"""""xmap ic <Plug>(coc-classobj-i)
"""""omap ic <Plug>(coc-classobj-i)
"""""xmap ac <Plug>(coc-classobj-a)
"""""omap ac <Plug>(coc-classobj-a)
"""""
"""""" Remap <C-f> and <C-b> for scroll float windows/popups.
"""""if has('nvim-0.4.0') || has('patch-8.2.0750')
"""""  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"""""  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"""""  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"""""  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"""""  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"""""  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"""""endif
"""""
"""""" Use CTRL-S for selections ranges.
"""""" Requires 'textDocument/selectionRange' support of language server.
"""""nmap <silent> <C-s> <Plug>(coc-range-select)
"""""xmap <silent> <C-s> <Plug>(coc-range-select)
"""""
"""""" Add `:Format` command to format current buffer.
"""""command! -nargs=0 Format :call CocAction('format')
"""""
"""""" Add `:Fold` command to fold current buffer.
"""""command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"""""
"""""" Add `:OR` command for organize imports of the current buffer.
"""""command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
"""""
"""""" Add (Neo)Vim's native statusline support.
"""""" NOTE: Please see `:h coc-status` for integrations with external plugins that
"""""" provide custom statusline: lightline.vim, vim-airline.
"""""set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"""""
"""""" Mappings for CoCList
"""""" Show all diagnostics.
"""""nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"""""" Manage extensions.
"""""nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"""""" Show commands.
"""""nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"""""" Find symbol of current document.
"""""nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"""""" Search workspace symbols.
"""""nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"""""" Do default action for next item.
"""""nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"""""" Do default action for previous item.
"""""nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"""""" Resume latest coc list.
"""""nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" #!/usr/bin/env bash
"""""" 
"""""" set -o nounset    # error when referencing undefined variable
"""""" set -o errexit    # exit when command fails
"""""" 
"""""" # Install latest nodejs
"""""" if [ ! -x "$(command -v node)" ]; then
""""""     curl --fail -LSs https://install-node.now.sh/latest | sh
""""""     export PATH="/usr/local/bin/:$PATH"
""""""     # Or use package manager, e.g.
""""""     # sudo apt-get install nodejs
"""""" fi
"""""" 
"""""" # Use package feature to install coc.nvim
"""""" 
"""""" # for vim8
"""""" mkdir -p ~/.vim/pack/coc/start
"""""" cd ~/.vim/pack/coc/start
"""""" curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
"""""" # for neovim
"""""" # mkdir -p ~/.local/share/nvim/site/pack/coc/start
"""""" # cd ~/.local/share/nvim/site/pack/coc/start
"""""" # curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
"""""" 
"""""" # Install extensions
"""""" mkdir -p ~/.config/coc/extensions
"""""" cd ~/.config/coc/extensions
"""""" if [ ! -f package.json ]
"""""" then
""""""   echo '{"dependencies":{}}'> package.json
"""""" fi
"""""" # Change extension names to the extensions you need
"""""" npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod


