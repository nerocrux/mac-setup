"/////////////////////////////////////////////////////////////
"General
"//////////////////////////////////////////////////////////////

" 新しい行のインデントを現在行と同じにする"
set autoindent

" インデントを連続的に変更できる

vnoremap < <gv
vnoremap > >gv

" バックアップファイルを作るディレクトリ"
set backupdir=$HOME/vimbackup

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 

"クリップボードをWindowsと連携
set clipboard=unnamed

"Vi互換をオフ
set nocompatible

"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup

"タブの代わりに空白文字を挿入する
set expandtab

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"インクリメンタルサーチを行う
set incsearch

"ハイライトサーチ
set hlsearch

"タブ文字、行末など不可視文字を表示する
set nolist

"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<

"行番号を表示する
set number

"シフト移動幅
set shiftwidth=4

"Tab空白量
set softtabstop=4
set tabstop=4

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"検索時に大文字を含んでいたら大/小を区別
set smartcase

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"ファイル内の <Tab> が対応する空白の数
"set tabstop=4
"カーソルを行頭、行末で止まらないようにする

set whichwrap=b,s,h,l,<,>,[,]

"検索をファイルの先頭へループしない
set nowrapscan

"色!
syntax on
set t_Co=256
colorscheme molokai 

"backspace
set backspace=indent,eol,start 

"File encoding
set encoding=utf-8
set fileencodings=euc-jp,utf-8

"ウィンドウを最大化して起動
au GUIEnter * simalt ~x

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

".txtファイルで自動的に日本語入力ON
au BufNewFile,BufRead *.txt set iminsert=2

".rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"NeoComplete自動有効
let g:neocomplcache_enable_at_startup = 1

"Taglist Keybind
nnoremap <silent> <F8> :TlistToggle<CR>

"set paste
map <silent> pst :set paste<CR>
map <silent> npst :set nopaste<CR>

"//////////////////////////////////////////////////////////////
"Coding
"//////////////////////////////////////////////////////////////

"PHP documents
let g:ref_phpmanual_path = '~/dotfiles/phpmanual'

"/////////////////////////////////////////////////////////////
"plugins settings
"/////////////////////////////////////////////////////////////

"neocomplcache
"============================================================
"imap  < C-k >   < Plug > (neocomplcache_snippets_expand)
"smap  < C-k >   < Plug > (neocomplcache_snippets_expand)
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
"============================================================

"Global
"============================================================
nmap <C-c> <C-w><C-w><C-w>q
nmap <C-g> :Gtags -g
nmap <C-l> :Gtags -f %<CR>
nmap <C-j> :Gtags <C-r><C-w><CR>
nmap <C-k> :Gtags -r <C-r><C-w><CR>
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>
"============================================================

"Unite
"============================================================
" 入力モードで開始
let g:unite_enable_start_insert=1

"mru,reg,buf
noremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
noremap :ur :<C-u>Unite register -buffer-name=register<CR>
noremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>

"file current_dir
noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>

"file file_current_dir
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>

" c-jはescとする
au FileType unite nnoremap <silent> <buffer> <c-j> <esc><CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"============================================================

"vimfiler
"============================================================
let g:vimfiler_as_default_explorer = 1
command Vf VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
"============================================================

"minibufexpl
"============================================================
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
nmap <Space> :MBEbn<CR>
"============================================================

"VimShell
"============================================================
nnoremap <silent> :is :VimShell<CR>
"============================================================

"YankRing
"============================================================
nnoremap <F10> :YRShow<CR>
"============================================================

"yanktmp
"============================================================
map <silent> sy :call YanktmpYank()<CR> 
map <silent> sp :call YanktmpPaste_p()<CR> 
map <silent> sP :call YanktmpPaste_P()<CR>
"============================================================

"EasyMotion
"============================================================
let g:EasyMotion_leader_key = '['
"============================================================

"gist
"============================================================
let g:github_user= 'nerocrux'
"============================================================

"Smooth Scroll
"============================================================
:map <C-A> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
:map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
"============================================================

"FuzzyFinder
"============================================================
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_file_exclude = '\v\~$|\.(o|exe|bak|swp|gif|jpg|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_mrufile_exclude = '\v\~$|\.bak$|\.swp|\.howm$|\.(gif|jpg|png)$'
let g:fuf_mrufile_maxItem = 10000
let g:fuf_enumeratingLimit = 20
let g:fuf_keyPreview = '<C-]>'
let g:fuf_previewHeight = 0

nmap bg :FufBuffer<CR>
nmap bG :FufFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nmap gb :FufFile **/<CR>
nmap br :FufMruFile<CR>
nmap bq :FufQuickfix<CR>
nmap bl :FufLine<CR>
nnoremap <silent> <C-]> :FufTag! <C-r>=expand('<cword>')<CR><CR> 
"============================================================

"Vundle
"============================================================
"ファイル形式の検出を無効にする
filetype off

"Vundleを初期化して
"Vundle自身もVundleで管理
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"github にあるプラグイン
Bundle 'cake.vim'
Bundle 'neocomplcache'
Bundle 'unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'surround.vim'
Bundle 'taglist.vim'
Bundle 'ZenCoding.vim'
Bundle 'ref.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'quickhl.vim'
Bundle 'MultipleSearch2.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'minibufexpl.vim'
Bundle 'zoom.vim'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vinarise'
Bundle 'Gundo'
Bundle 'YankRing.vim'
Bundle 'yanktmp.vim'
Bundle 'houtsnip/vim-emacscommandline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'DrawIt'
Bundle 'Align'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tomtom/tcomment_vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'Smooth-Scroll'
Bundle 'taku-o/vim-toggle'
Bundle 'mattn/emmet-vim'
Bundle 'fuzzyjump.vim'
Bundle 'netrw.vim'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'mru.vim'
Bundle 'fatih/vim-go'

"vim-scripts プラグイン

"github にないプラグイン

"ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on
"============================================================
