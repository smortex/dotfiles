syntax on

set number relativenumber
set mouse=

call plug#begin('~/.config/nvim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'vim-airline/vim-airline'
Plug 'benekastah/neomake'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'rodjek/vim-puppet'
Plug 'godlygeek/tabular'
Plug 'breard-r/vim-dnsserial'
Plug 'guns/vim-clojure-static'
Plug 'dpelle/vim-Grammalecte'
Plug 'Shougo/unite.vim'
Plug 'Quramy/vison'
Plug 'mzlogin/vim-markdown-toc'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
call plug#end()

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set cino=t0(0:0

set modeline

colorscheme molokai

autocmd FileType ruby set et ts=2 sw=2
autocmd FileType cucumber set et ts=2 sw=2
autocmd FileType c set noet ts=8 sw=4

autocmd BufNewFile,BufRead *_spec.rb map <F5> :exe '!bundle exec rspec ' . shellescape(expand("%:p")) .':' . line('.')<CR>
autocmd BufNewFile,BufRead *.ddl set syntax=ruby

autocmd BufNewFile,BufRead *.tex set et ts=2 sw=2 tw=72
autocmd BufNewFile,BufRead *.wxs set makeprg=rake\ msi autowrite

set foldmethod=marker
nnoremap <CR> :noh<CR><CR>

inoremap 8< ---------------------------------- 8< ----------------------------------

