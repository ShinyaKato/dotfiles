"
" Vundleの設定
set nocompatible
filetype off
set rtp+=~/dotfiles/vimfiles/vundle.vim.git
call vundle#begin()
Plugin 'gmarik/Vundle.vim'               " Let Vundle manage itself
Plugin 'Shougo/unite.vim'                " ファイルオープンを便利に
Plugin 'Shougo/neomru.vim'               " Unite.vimで最近使ったファイルを表示できるようにする
Plugin 'scrooloose/nerdtree'             " ファイルをツリー表示
Plugin 'tpope/vim-endwise'               " rubyのendを自動保管
Plugin 'tomtom/tcomment_vim'             " 'Ctrl' + '_'を二回押すとコメントアウト
Plugin 'nathanaelkane/vim-indent-guides' " インデントを可視化
Plugin 'vim-scripts/AnsiEsc.vim'         " ログファイルを色付け
Plugin 'tpope/vim-rails'                 " Railsプロジェクト内を自由に行き来できる
Plugin 'mattn/emmet-vim'                 " htmlのコーディング支援
Plugin 'tpope/vim-surround'              " 「テキストを囲うテキスト」オブジェクトを追加
Plugin 'hail2u/vim-css3-syntax'          " CSS3の追加syntax
Plugin 'othree/html5.vim'                " html5の追加syntax
Plugin 'jelera/vim-javascript-syntax'    " JavaScriptの追加syntax
Plugin 'kchmck/vim-coffee-script'        " CoffeeScriptの追加syntax
Plugin 'bronson/vim-trailing-whitespace' " 行末のスペースを可視化
Plugin 'tpope/vim-fugitive'              " VimからGit操作を可能にする
call vundle#end() " required !!
filetype plugin indent on

"
" Unit.vimの設定
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"
" NERDTree設定
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"
" IndentGuides設定
let g:indent_guides_enable_on_vim_startup=1 " vimの起動時に自動的にインデントを可視化

"
" vim-rails設定
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
let g:rails_some_option = 1
let g:rails_statusline = 1
let g:rails_syntax = 1
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction
aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END
aug RailsDictSetting
  au!
aug END

"
" mru settings
let MRU_Auto_Close=1
let MRU_Window_Height=15
let MRU_Max_Entries=100
let MRU_Window_Open_Always=1
let MRU_Open_File_Use_Tabs=1
nnoremap R :MRU<CR>

"
" 基本設定 (参考 http://qiita.com/jnchito/items/5141b3b01bced9f7f48f)
set noswapfile                   " スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set ruler                        " カーソルが何行目の何列目に置かれているかを表示する
set cmdheight=2                  " コマンドラインに使われる画面上の行数
set laststatus=2                 " エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set title                        " ウインドウのタイトルバーにファイルのパス情報等を表示する
set wildmenu                     " コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set showcmd                      " 入力中のコマンドを表示する
set smartcase                    " 小文字のみで検索したときに大文字小文字を無視する
set hlsearch                     " 検索結果をハイライト表示する
set background=dark              " 暗い背景色に合わせた配色にする
set expandtab                    " タブ入力を複数の空白入力に置き換える
set incsearch                    " 検索ワードの最初の文字を入力した時点で検索を開始する
set hidden                       " 保存されていないファイルがあるときでも別のファイルを開けるようにする
set list                         " 不可視文字を表示する
set listchars=tab:>\ ,extends:<  " タブと行の続きを可視化する
set number                       " 行番号を表示する
set showmatch                    " 対応する括弧やブレースを表示する
set autoindent                   " 改行時に前の行のインデントを継続する
set smartindent                  " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set tabstop=2                    " タブ文字の表示幅
set shiftwidth=2                 " Vimが挿入するインデントの幅
set smarttab                     " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
syntax on                        " 構文毎に文字色を変化させる
colorscheme desert               " カラースキーマの指定
set backspace=2                  " backspaceを有効にする
set clipboard=unnamed,autoselect " クリップボードを使用
set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']'}%{fugitive#statusline()}%=%l,%c%V%8P

"
" タブまわりのキーバインド
nnoremap <silent> <TAB>c :tabnew<CR>
nnoremap <silent> <TAB>n :tabnext<CR>
nnoremap <silent> <TAB>w :tabclose<CR>
nnoremap <silent> <TAB><S-w> :tabonly<CR>
nnoremap <silent> <TAB>1 :tabn 1<CR>
nnoremap <silent> <TAB>2 :tabn 2<CR>
nnoremap <silent> <TAB>3 :tabn 3<CR>
nnoremap <silent> <TAB>4 :tabn 4<CR>
nnoremap <silent> <TAB>5 :tabn 5<CR>
nnoremap <silent> <TAB><TAB> :tabnext <CR>
nnoremap <silent> <TAB><RIGHT> :tabnext <CR>
nnoremap <silent> <TAB><LEFT> :tabprevious <CR>

"
" ファイルを閉じるときにカーソル位置を記憶
if has("autocmd")
  augroup redhat
    autocmd BufRead *.txt set tw=78 " In text files, always limit the width of text to 78 characters
    autocmd BufReadPost *           " When editing a file, always jump to the last cursor position
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
    augroup END
endif

