" BASICS
" Tabs 
" Two space tabs 
set tabstop=2 
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

" Line numbers and underline the current line
set number
set relativenumber
set cursorline
autocmd ColorScheme * highlight cursorline term=underline cterm=underline ctermfg=none ctermbg=none

"Change keys to switch between splits
nnoremap <DOWN> <C-W><C-J> 
nnoremap <LEFT> <C-W><C-H> 
nnoremap <UP> <C-W><C-K>
nnoremap <RIGHT> <C-W><C-L>

" PLUGINS using the installer PLUG
call plug#begin('~/.local/share/nvim/site/autoload')
 
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } let
"  g:deoplete#enable_at_startup = 1 let g:deoplete#sources = {} let
"  g:deoplete#sources._ = ['file', 'neosnippet'] let g:deoplete#omni#functions
"  = {} let g:deoplete#omni#input_patterns = {} inoremap <expr><tab>
"  pumvisible() ? "\<c-n>" : "\<tab>"


Plug 'https://github.com/purescript-contrib/purescript-vim' 
Plug 'https://github.com/joshdick/onedark.vim' 
Plug 'https://github.com/scrooloose/nerdtree.git' 
Plug 'https://github.com/scrooloose/nerdcommenter' 
Plug 'https://github.com/junegunn/seoul256.vim' 
Plug 'https://github.com/reasonml-editor/vim-reason-plus' 
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'https://github.com/vim-scripts/bash-support.vim'  
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'autozimu/LanguageClient-neovim', { 
      \ 'branch': 'next', 
      \ 'do': 'bash install.sh', 
      \ }
Plug 'roxma/nvim-completion-manager'

" (Optional) Mulit-entry selection UI.
Plug 'https://github.com/junegunn/fzf'

call plug#end()

" Language Specific Stuff
let g:LanguageClient_autoStart = 1

"try to set the leader key to space and change the command key from : to ; and
"change ESC to jk This has all been completed and appears to work

:nnoremap <Space> <nop> 
let mapleader=","
" :map <Space> <leader> 
" :let mapleader="<Space>" 
:inoremap jk <esc> 
:nnoremap ; :

"Reason Support
 let g:LanguageClient_serverCommands = { 
       \ 'reason':['ocaml-language-server','--stdio'], 
       \ 'ocaml': ['ocaml-language-server','--stdio'], 
       \ }

noremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

" Settings for NERDCommenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1


" Elm support h/t
" https://github.com/ElmCast/elm-vim/issues/52#issuecomment-264161975 let
" g:deoplete#sources.elm = ['omni'] + g:deoplete#sources._ let
" g:deoplete#omni#functions.elm = ['elm#Complete'] let
" g:deoplete#omni#input_patterns.elm = '[^ \t]+' let
" g:deoplete#disable_auto_complete = 1


"Purescript Support
" syntax on
" filetype on
" filetype plugin indent on
" let purescript_indent_if = 3
" let purescript_indent_case = 5
" let purescript_indent_let = 4
" let purescript_indent_where = 6
" let purescript_indent_do = 3
" let purescript_indent_in = 1
" let purescript_indent_dot = v:true

" COLORSCHEMES

"

set background=dark
colorscheme PaperColor
"This set of commands is an attempt to make sure the background is truly
"black.
let g:PaperColor_Theme_Options = {
 \    'theme': {
 \      'default.dark': {
 \        'override': {
 \          'color00': ['#000000','0']
 \        }
 \      }
 \    }
 \  }

"This is what is actually needed to make the background truly black
highlight Normal ctermbg=None

" BACKUPS
" Turn on Backup
set backup

"where to store backups
set backupdir=~/backup//

"make backup before overwriting buffer
set writebackup

"Overwrite the original backup file
set backupcopy=yes

"Meaningful backup name filename@2018-08-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
