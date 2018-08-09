set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'	"NERDTree

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'


Plugin 'jistr/vim-nerdtree-tabs'       "NERDTree Tabs
Plugin 'fholgado/minibufexpl.vim'      "MiniBufExpl
Plugin 'vim-scripts/autocomplpop'      "Autocomplpop
Plugin 'vim-scripts/pydiction'         "Pydiction

"Vundle End
call vundle#end()
"Now we can turn our filetype functionality back on
filetype plugin indent on



"Options(optional)

set history=400              "The command-lines that you enter are remembered in a history table
set expandtab                "Use spaces instead of tabs
set tabstop=4                "1 tab == 4 spaces

set shiftwidth=4             "Number of spaces to use for each step of (auto)indent
set autoindent               "Copy indent from current line when starting a new line
"set smartindent              "Do smart autoindenting when starting a new line
set nu                       "Show line numbers
set showmatch                "Show matching brackets when text indicator is over them
set mouse=a                  "Enable the use of the mouse

"set ruler                    "Always show current position
"set incsearch                "Makes search act like search in modern browsers
set hlsearch                 "Highlight search results
"set smartcase                "When searching try to be smart about cases
"set ignorecase               "Ignore case when searching
"set nowrapscan               "Do not wrap around when searching

set vb t_vb=                 "Turn off visual bell
set cursorline               "Highlight the current line
"set cursorcolumn             "Highlight the current column

set hidden                   "A buffer becomes hidden when it is abandoned
"set wildmenu                 "Turn on the wild menu

set autoread                 "Set to auto read when a file is changed from the outside
set autowrite                "Auto saves changes when quitting and swiching buffer
set nowrap                   "Do not wrap lines
"set backup                   "Keep a backup file with suffix ~
"set noswapfile               "Do not use a swapfile for the buffer


"Change the indentation behavior based on the file type
autocmd Filetype css,html,javascript,ruby,sh,vim,xml,yaml setlocal expandtab tabstop=2 shiftwidth=2
"autocmd BufNewFile,BufReadPost *.coffee setlocal expandtab tabstop=2 shiftwidth=2

"Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Display unprintable characters: <Tab> as |
set list
set listchars=tab:\|\ ,

"Enable syntax highlighting
syntax enable
syntax on

"Underline the characters at column 80
au BufRead,BufNewFile *.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.py,*.rb,*.erb,*.vim 2match Underlined /.\%81v/

"Customize the status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set laststatus=2             "Always show status line

"Automatic detection will be done when reading a file
set fileformats=unix,dos,mac

"Default file encoding
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

"Set the current language
language messages en_US.utf-8

""Plugins(optional)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1

"Map Taglist to <F10>
nnoremap <silent> <F10> :Tlist<CR>

"Map NERDTree Tabs to <F9>
nnoremap <silent> <F9> :NERDTreeTabsToggle<CR>

"Map <C-W> to <F8>
nnoremap <silent> <F8> <C-W>w

"Map Pyflakes to <F7>
"autocmd FileType python map <buffer> <F7> :call Pyflakes()<CR>

"Turn on/off paste-mode by <F6> to paste code without auto-indent and auto-complete
set pastetoggle=<C-F6>

"Pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

"MiniBufExpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1 
