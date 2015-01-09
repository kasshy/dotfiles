" matchit {{{
" if や for などの文字にも%で移動できるようになる
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
" }}}

" usability {{{
" 挿入モードから抜ける際にIMEがオフとなる
set imdisable
" set t_Co=256は256色対応のターミナルソフトでのみ作用するので、Winのコマンドプロンプト使っている人などは ダブルコーテーションでコメントアウトしといて
set t_Co=256
" 色づけを on にする
syntax on
" ターミナルの右端で文字を折り返さない
set nowrap
" tempファイルを作らない。編集中に電源落ちまくるし、とかいう人はコメントアウトで
set noswapfile
" ハイライトサーチを有効にする。文字列検索は /word とか * ね
set hlsearch
" 大文字小文字を区別しない(検索時)
set ignorecase
" ただし大文字を含んでいた場合は大文字小文字を区別する(検索時)
set smartcase
" カーソル位置が右下に表示される
set ruler
" 行番号を付ける
set number
" タブ文字の表示 ^I で表示されるよ
set list
" コマンドライン補完が強力になる
set wildmenu
" コマンドを画面の最下部に表示する
set showcmd
" クリップボードを共有する(設定しないとvimとのコピペが面倒です)
set clipboard=unnamed
" 改行時にインデントを引き継いで改行する
set autoindent
" インデントにつかわれる空白の数
set shiftwidth=4
" <Tab>押下時の空白数
set softtabstop=4
" <Tab>押下時に<Tab>ではなく、ホワイトスペースを挿入する
set expandtab
" <Tab>が対応する空白の数
set tabstop=4
" インクリメント、デクリメントを16進数にする(0x0とかにしなければ10進数です。007をインクリメントすると010になるのはデフォルト設定が8進数のため)
set nf=hex
" マウス使えます
set mouse=a
" インサートモードの時に C-j でノーマルモードに戻る
imap <C-j> <esc>
" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
imap [ []<left>
imap ( ()<left>
imap { {}<left>
" ２回esc を押したら検索のハイライトをヤメる
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" }}}

set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif 

NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'

filetype plugin indent on

" hybrid
NeoBundle 'w0ng/vim-hybrid'
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" mustang
NeoBundle 'croaker/mustang-vim'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" molokai
NeoBundle 'tomasr/molokai'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" markdownでプレビューするやーつ
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

""" markdown & preview {{{
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
" }}}
