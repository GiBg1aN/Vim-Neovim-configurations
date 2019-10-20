syntax on
set history=500 "Max search pattern to store
set number "Line number
set showmode "Show Vim mode on last line
set ignorecase "no case sensitive in pattern
set smartcase "case sensitive only when caps is used
set smartindent "auto indend
set expandtab
set shiftwidth=4 "autoindent tab chars
set softtabstop=4 "already present tabs are considered as 4 spaces
set scrolloff=7 " Set 7 lines to the cursor - when moving vertically using j/k
set mouse=a " Enable Mouse
set cmdheight=2 " Height of the command bar
set hidden " A buffer becomes hidden when it is abandoned
"set lazyredraw " Don't redraw while executing macros (good performance config)
set linebreak
set textwidth=500 " Line length

" Window title
set titlestring=NVIM
set title

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Edit/Save vimrc file
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Filetype based options
let g:tex_flavor = "latex"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType tex setlocal textwidth=83

" Moving between windows
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"Y to works from the cursor to the end of line (not Vi-compatible) use
map Y y$

"Escape from terminal mode and escape 'Esc' key in terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Disable line numbers in terminal mode
au TermOpen * setlocal nonumber norelativenumber

" Scroll terminal history in terminal mode
tnoremap <M-j> <C-n>
tnoremap <M-k> <C-p>
tnoremap <M-h> <Left>
tnoremap <M-l> <Right>

" Clipboard setup (Linux version, requires xsel)
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': 'xsel --clipboard --input',
      \      '*': 'xsel --clipboard --input',
      \   },
      \   'paste': {
      \      '+': 'xsel --clipboard --output',
      \      '*': 'xsel --clipboard --output',
      \   },
      \   'cache_enabled': 1,
      \ }


""" My font is Source Code Pro
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
""""" Completion/Compilation
Plug	'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug    'davidhalter/jedi-vim', { 'do': ':UpdateRemotePlugins', 'commit': 'b9f83175951654256cff41737841b4abc0c9266d' }
Plug    'https://github.com/blueyed/jedi-vim/', { 'do': ':UpdateRemotePlugins', 'branch': 'completions-opt', 'commit': 'a28da90f28e123c3ec4e49a0c9dfafe781500207' }
Plug	'Shougo/neoinclude.vim'
Plug	'neomake/neomake'
Plug	'lervag/vimtex', { 'do': ':UpdateRemotePlugins' }
Plug	'jiangmiao/auto-pairs'
""""" Utility
Plug	'kien/ctrlp.vim'
Plug	'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug	'scrooloose/nerdcommenter'
Plug	'airblade/vim-gitgutter'
Plug    'tpope/vim-speeddating'
Plug    'lambdalisue/suda.vim'
""""" Appereance 
Plug	'joshdick/onedark.vim'
Plug	'junegunn/goyo.vim', {'on': 'Goyo'}
Plug	'itchyny/lightline.vim'
Plug    'Yggdroot/indentLine'
""""" Haskell
"Plug	'neovimhaskell/haskell-vim'
"Plug	'enomsg/vim-haskellConcealPlus'
"Plug	'parsonsmatt/intero-neovim'
call plug#end()


""""""" ONEDARK """""""
"Use 24-bit (true-color) mode in Vim/Neovim.
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799
if (has("termguicolors"))
    set termguicolors
endif

colorscheme onedark
" Colorscheme for lightline
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE


""""" HASKELL VIM """""
"let g:haskell_classic_highlighting = 1
"let g:haskell_indent_if = 3
"let g:haskell_indent_case = 2
"let g:haskell_indent_let = 4
"let g:haskell_indent_where = 6
"let g:haskell_indent_before_where = 2
"let g:haskell_indent_after_bare_where = 2
"let g:haskell_indent_do = 3
"let g:haskell_indent_in = 1
"let g:haskell_indent_guard = 2
"let g:haskell_indent_case_alternative = 1
"let g:cabal_indent_section = 2


"""""" NERD TREE """"""
"Toggle NERDTree with Ctrl-N
map <C-n> :NERDTreeToggle<CR>
"Show hidden files in NERDTree
"let NERDTreeShowHidden=1


""""""" NEOMAKE """""""
function! MyOnBattery()
  return has('unix') && readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction

if GetRunningOS() =~ "linux" &&  MyOnBattery() 
  call neomake#configure#automake('w') " When writing a buffer.
else 
  call neomake#configure#automake('nw', 1000) " When writing a buffer, and on normal mode changes (after 1s).
endif

" Automatically disables ghcmod-hlint-hdevtools
" let g:neomake_haskell_enabled_makers = []


"""""" VIM HASKELL CONCEAL PLUS """"""
"let hscoptions="𝐌𝐄rbhm↱wTt"


""""""""""""" DEOPLETE """""""""""""""
let g:deoplete#enable_at_startup = 1

" Disable completion for plain text/git files
autocmd FileType text call deoplete#disable()
autocmd FileType gitcommit call deoplete#disable()

" <TAB> selection
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


""""""""""""" VIM-JEDI """"""""""""""
let g:python3_host_prog = '/home/gibg1an/.conda/envs/torch/bin/python'
autocmd FileType python call deoplete#disable()


"""""""""""""" VIMTEX """"""""""""""""
let g:vimtex_compiler_progname = 'nvr'

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" Remove surrounding text source completion for plain tex files
autocmd FileType tex let g:deoplete#ignore_sources={'_': ['buffer', 'around']}

"""""""""" NERD COMMENTER """"""""""""
map <C-_> <leader>c<space>


""""""""""""""" GOYO """""""""""""""""
let g:goyo_width=83


""""""""""""""" SUDA """""""""""""""""
" :W sudo saves the file (useful for handling the permission-denied error)
cnoremap W w suda://% 


"""""""""" VIM INDENT LINE """""""""""
let g:indentLine_enabled = 0

