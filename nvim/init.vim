" -----------------------------------------------------------------------------
"     - Colours -
" -----------------------------------------------------------------------------
" colorscheme togglebit

" -----------------------------------------------------------------------------
"     - Leader -
" -----------------------------------------------------------------------------
let g:mapleader="\\"

" -----------------------------------------------------------------------------
"     - Default settings -
" -----------------------------------------------------------------------------
filetype plugin indent on
syntax on

set nopreviewwindow
set fillchars+=vert:│
set tabstop=4
set expandtab
set shiftwidth=4
set whichwrap=b,s,<,>,h,l,[,]
set incsearch
set ignorecase
set smartcase
set smartindent
set wildmenu
set wildmode=full
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10
set ruler
set laststatus=0
set splitright
set splitbelow
set backspace=indent,eol,start
set nowrap
" set nohlsearch
set ttimeoutlen=10
set noswapfile
set colorcolumn=80
set nosmd
set hidden
set nomodeline

let g:netrw_banner=0

" -----------------------------------------------------------------------------
"     - Generic key bindings -
" -----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = '<leader>t'

nmap <C-p> :FZF<CR>
nmap <C-h> :vertical resize -4<CR>
nmap <C-l> :vertical resize +4<CR>
nmap <C-k> :resize +4<CR>
nmap <C-j> :resize -4<CR>
nmap <Leader>} ysiw}
nmap <C-f> :Rg 

" Terminal flapping
tmap <C-w>k <C-\><C-n><C-w>k 
tmap <C-w>j <C-\><C-n><C-w>j 
tmap <C-w>h <C-\><C-n><C-w>h 
tmap <C-w>l <C-\><C-n><C-w>l 

if has("nvim")
    au TermOpen * exec "normal G"
endif

" -----------------------------------------------------------------------------
"     - Grep -
" -----------------------------------------------------------------------------
set grepprg=rg\ --vimgrep


" -----------------------------------------------------------------------------
"     - Debugging -
" -----------------------------------------------------------------------------
packadd termdebug
let g:termdebug_wide = 1

" -----------------------------------------------------------------------------
"     - Explore -
" -----------------------------------------------------------------------------
" nmap <silent><C-n> :15Lexplore!<cr>
let g:netrw_liststyle = 3


" -----------------------------------------------------------------------------
"     - Date functions -
" -----------------------------------------------------------------------------
" Insert date stamp above current line.
" This is useful when organising tasks in README.md
function! InsertDateStamp()
    let l:date = system('date +\%F')
    let l:oneline_date = split(date, "\n")[0]
    execute "normal! a" . oneline_date . "\<Esc>"
endfunction

:command! DS call InsertDateStamp()


" -----------------------------------------------------------------------------
"     - Human error correction -
" -----------------------------------------------------------------------------
:command! W w

" -----------------------------------------------------------------------------
"     - Glsl -
" -----------------------------------------------------------------------------
autocmd! BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag set ft=glsl

" -----------------------------------------------------------------------------
"     - Other things -
" -----------------------------------------------------------------------------
set number
set clipboard=unnamedplus
set mouse=a
set scrolloff=8
set sidescrolloff=8
set title
set laststatus=2
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set cursorcolumn
set cursorline

" -----------------------------------------------------------------------------
"     - Plugins -
" -----------------------------------------------------------------------------
" Gruvbox theme
autocmd vimenter * ++nested colorscheme gruvbox

" -- SHOW INDENTATION --
" use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4
" display indentation guides
"set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
set list listchars=tab:❘·,trail:·,extends:»,precedes:«
" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4
" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4
" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4
