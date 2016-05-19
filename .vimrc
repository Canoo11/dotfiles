"---gvim
if has("gui_running")
	set lines=9999
	set columns=9999
	set guifont=Ricty\ Diminished\ Discord\ 11
endif

"---Display Setting
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set smartindent "オートインデント
set tabstop=4
set shiftwidth=4
set softtabstop=0
filetype plugin indent on
syntax enable

"---Search Setting
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"---color scheme
set background=dark
colorscheme hybrid

"---NeoBundle
if has('vim_starting')
" 初回起動時のみruntimepathにneobundleのパスを指定する
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"---NeoBundlePlugin
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'basyura/TweetVim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
"NeoBundle 'TwitVim'

call neobundle#end()
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

"---Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1

let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
  \ }

"---Merlin
if executable('ocamlmerlin') && has('python')
	let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/merlin"
	execute "set rtp+=".s:ocamlmerlin."/vim"
	execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
endif

"---TwitVim
"let twitvim_enable_perl = 1
"let twitvim_enable_python = 1
"let twitvim_enable_python3 = 1
"let twitvim_enable_tcl = 1
"let twitvim_browser_cmd = 'firefox'
"let tiwtvim_count = 40

"---TweetVim
let g:tweetvim_display_icon = 1
let g:tweetvim_tweet_per_page = 40


"---keyMapping
let mapleader = "\<Space>"
inoremap <C-j> <Esc>

nnoremap : ;
nnoremap ; :

" Plugin key-mappings.
" Neocomplete
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
noremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	  return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" twitvim
"nnoremap <leader>tl :FriendsTwitter<CR>
"nnoremap <leader>tp :PosttoTwitter<CR>

" tweetvim
nnoremap <leader>tl :TweetVimHomeTimeline<CR>
nnoremap <leader>tp :TweetVimCommandSay<CR>



