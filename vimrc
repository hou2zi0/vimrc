set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set hidden
set incsearch
set scrolloff=8
set termguicolors
set signcolumn=yes
set background=dark 
set noerrorbells
set encoding=UTF-8

" Make sure you use single quotes for line comment

" Remapping of key strokes <leader> is \-key
nnoremap <leader>q :bp<cr>:bd #<cr>

" Check if all plugins are installed. If not install them.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" PLUGIN SECTION 
" List plugins here
" Shorthand notation; fetches https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree'
Plug 'bling/vim-bufferline'
" Initialize plugin system
call plug#end()

" For snippet expansion on tab-key
let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"

" gruvbox theme
autocmd vimenter * ++nested colorscheme gruvbox

" NERDTree filebrowser configuration
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
   \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Movement in NERDTree
" ctrl-w + w toggles through the vim window sections currently open, e.g.
" NERDtree (in the sidebar) and your open file (in the mainview).
" ctrl-w + h or ctrl-w + l switch to the left or right section.
" \ + q closes a buffer (currently opened file in mainview).
" :bd closes current buffer.
" :ls lists current buffers.
"
" Common commands
" ESC + : changes to command mode.
" Movement with hjkl (left, down, up, right) or arrow keys.
" dd erases line.
" y copy line, d cuts line.
" p pastes line.
" More https://linuxize.com/post/how-to-copy-cut-paste-in-vim/
" i gets into insert mode, I gets into insert mode and puts carret at
" beginning of line.
" ^ & _ jump to beginning of line, $ to end of line.
" NUMBERj or NUMBERk jump NUMBER of lines up or down.
" :q quits, :w saves.
" Cheat sheet http://www.fprintf.net/vimCheatSheet.html


