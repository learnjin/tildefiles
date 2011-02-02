" inspirations from:
" http://github.com/hgimenez/vimfiles/blob/c07ac584cbc477a0619c435df26a590a88c3e5a2/vimrc#L72-122
" http://nvie.com/posts/how-i-boosted-my-vim/

"""""""""""""""""""""""""""""""""
" Pathogen Plugin
" http://www.vim.org/scripts/script.php?script_id=2332
"""""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" enable matchit by hand
runtime macros/matchit.vim

" simple notetaking, best synchronized with dropbox
" inspired from http://ktuman.blogspot.com/2010/06/ubiquitous-note-taking-with-vim-and.html

" map <leader>nn :tabedit ~/Dropbox/Notes/


"""""""""""""""""""""""""""""""""
" from vimcasts.org
""""""""""""""""""""""""""""""""""
command! -nargs=* Wrap set wrap linebreak nolist

set formatprg=par\ -w72

" open edit from the same directory as the current buffer
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

"""""""""""""""""""""""""""""""""
" Basics
"""""""""""""""""""""""""""""""""
set nocompatible

if has("autocmd")
endif

"""""""""""""""""""""""""""""""""
" http://nvie.com/posts/how-i-boosted-my-vim/
"""""""""""""""""""""""""""""""""
" ease the entire customization process
let mapleader = ","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" don't be required to save when opening new file
set hidden

" most basic settings
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent " copy the previous indentation on autoindenting
set shiftround " use multiple of shiftwidth when indenting with '<' and '
set showmatch " show matching parenthesis 
set hlsearch
set incsearch
set ignorecase
set smartcase

" think big and more goodess
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class "ignore files when tab-completing
set title " change the terminal's title
set visualbell
set noerrorbells
set nobackup
set noswapfile

"display unreadable characters
set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.
" set listchars=tab:˲ˍ,trail:˽,nbsp:˽,eol:¶
set listchars=tab:▸\ ,eol:¬ ",trail:˽,nbsp:˽
map <leader>l :set list!<CR>

" prevent 'smart'-indentation on demand (think paste as plain text)
" set pastetoggle=<F2>


" some neat shortcuts and 'syntactical detours'
set mouse=a
" nnoremap ; :
vmap Q gq
nmap Q gqap
" buffer navigation
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap j gj
nnoremap k gk
" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" reenable super-user 
cmap w!! w !sudo tee % > /dev/null

" end of nvie.com inspiration
"""""""""""""""""""""""""""""""""


filetype plugin indent on

" tell vim to rememeber stuff on exit
set viminfo='10,\"100,f1,<500,:100,/100,h,%
set history=1000

" tabs and indentation
set tabstop=2 shiftwidth=2 expandtab
" set cindent autoindent smarttab
"set backspace=2

set splitbelow                    " Split windows at bottom
set splitright                    " Split window to right
set ttimeoutlen=50                " Speed up <esc>




" Visual stuff
set ruler
set linebreak
set novisualbell
set noerrorbells
set laststatus=2 "always show status line



" Additional stuff

set cf "enable error files and error jumping
set history=1024
set autowrite " writes on make/shell commands
set ruler
"set number "line numbers on

""""""""""""""""""""""""""""""""""""""""""""
" LOOKS
""""""""""""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256
"colorscheme darkspectrum
colorscheme koehler

"""""""""""""""""""""""""""""""""
" Searching and navigation
"""""""""""""""""""""""""""""""""
set ignorecase        " search case insensitive
set smartcase         " search case sensitive when term has a capital letter
set hlsearch          " Highlight search terms...
set incsearch         " search dynamically as keyword is typed.

set tags=tags;$GEM_HOME  " tagfiles




""" Key bindings

" map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
" map <F3> :source ~/vim_session <cr>     " And load session with F3
map <silent><F5> :!ctags -R --exclude=.svn --exclude=.git --exclude=log *<CR>
nnoremap <C-L> :nohls<CR><C-L>


map <Up> gk
map <Down> gj
imap <Up> <esc>gka
imap <Down> <esc>gja

imap<C-D> <esc>lxi

" leader mappings
" map <leader>d :NERDTreeToggle<CR>
" map <F3> :NERDTreeToggle<CR>
"map <leader>b :FufBuffer<CR>
" map <leader>f :FufFile<CR>
"map <leader>t :TlistToggle<CR>


cmap <C-CR> <CR><CR>

vmap <tab> :Align\|<CR>=

":nnoremap <F5> :buffers<CR>:buffer<Space>
""nnoremap <F2> :Rfind<Space>

:nnoremap <leader>r :!ruby %<CR> 

"""""""""""""""""""""""""""""""""
" Backup files
"""""""""""""""""""""""""""""""""

" Use a common directory for backups and swp files
" Create it if it doesn't exist
silent execute '!mkdir -p ~/.vim_backups'
set backupdir=~/.vim_backups//
set directory=~/.vim_backups//


"""""""""""""""""""""""""""""""""
" Plugin customizations
"""""""""""""""""""""""""""""""""
" RDEBUG PLUGin"



" RAILS.VIM Customizations
autocmd User Rails Rnavcommand feat features -glob=*.* -suffix=.feature
autocmd User Rails Rnavcommand step features/step_definitions -glob=*.* -suffix=_steps.rb

"bind control-l to hashrocket
imap <C-l> <Space>=><Space>"


