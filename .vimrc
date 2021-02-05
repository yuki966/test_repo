"setting
"文字コードをUFT-8に設定
set encoding=utf-8
scriptencoding utf-8 " バックアップファイルを作らない set nobackup " スワップファイルを作らない set noswapfile " 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する set showcmd

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" 改行時に前の行のインデントを継続する
set autoindent
" インデントはスマートインデント
set smartindent
filetype indent on
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
" syntax enable
" ビープ音の消去
set vb t_vb=
set belloff=all

" Tab系
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set title
set whichwrap=b,s,[,],<,>
set hlsearch


" if !&compatible
  " set nocompatible
" endif

" reset augroup
" augroup MyAutoCmd
  " autocmd!
" augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.vim/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" プラグイン以外のその他設定が続く
" :


filetype plugin indent on

syntax enable

inoremap <expr> = smartchr#loop('=', ' == ', ' = ')
inoremap <expr> + smartchr#loop('+', '++', ' + ')
" inoremap <expr> - smartchr#loop('-', '--', ' - ')
inoremap <expr> / smartchr#loop('/', '//', ' / ')
inoremap <expr> , smartchr#loop(', ', ',')


" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


" nmap <silent> <C-g><C-n> <Plug>GitGutterNextHunk
" nmap <silent> <C-g><C-p> <Plug>GitGutterPrevHunk


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


inoremap <silent> jj <ESC>:<C-u>w<CR>



" 折り返し行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 20行ずつ移動
nnoremap <C-o> 20j
vnoremap <C-o> 20j
nnoremap <C-p> 20k
vnoremap <C-p> 20k


" map <C-n> :NERDTreeToggle<CR>


autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt
autocmd BufNewFile *.pl 0r $HOME/.vim/template/pl.txt
autocmd BUfNewFile *.l 0r $HOME/.vim/template/l.txt
autocmd BUfNewFile *.html 0r $HOME/.vim/template/html.txt



" Fern

" let g:fern#renderer = 'nerdfont'
" augroup __fern__
"     au!
"     autocmd VimEnter * ++nested Fern . -drawer -stay -keep -toggle -reveal=%
" augroup END
"
" nnoremap ,t :<c-u>Fern . -drawer -stay -keep -toggle -reveal=%<cr>

" neovim terminal mapping


