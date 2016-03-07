"
" Vundleの設定
set nocompatible
filetype off
set rtp+=~/dotfiles/vimfiles/vundle.vim.git
call vundle#begin()
Plugin 'gmarik/Vundle.vim'               " Let Vundle manage itself
Plugin 'git://github.com/Shougo/vimproc'
Plugin 'Shougo/unite.vim'                " ファイルオープンを便利に
Plugin 'Shougo/vimfiler.vim'             " ファイラ
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
Plugin 'pangloss/vim-javascript'         " JavaScriptの追加syntax
Plugin 'kchmck/vim-coffee-script'        " CoffeeScriptの追加syntax
Plugin 'mxw/vim-jsx'                     " JSXの追加syntax(vim-javascriptに依存)
Plugin 'bronson/vim-trailing-whitespace' " 行末のスペースを可視化
Plugin 'tpope/vim-fugitive'              " VimからGit操作を可能にする
Plugin 'junegunn/vim-easy-align'         " 整列を簡単にする
Plugin 'basyura/TweetVim'                " vimでTwitter
Plugin 'mattn/webapi-vim'
Plugin 'basyura/twibill.vim'
Plugin 'tyru/open-browser.vim'
Plugin 'h1mesuke/unite-outline'
Plugin 'basyura/bitly.vim'
Plugin 'slim-template/vim-slim'
Plugin 'rking/ag.vim'
call vundle#end() " required !!
filetype plugin indent on


"
" Unit.vim
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"
" NERDTree
nnoremap <silent> <space>e :NERDTreeToggle<CR>

"
" IndentGuides
let g:indent_guides_enable_on_vim_startup=1

"
" vim-rails
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

" JSX
let g:jsx_ext_required = 0 " .js拡子でも有効にする

" Eash Align
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" <-- default delimiters -->
" let s:easy_align_delimiters_default = {
" \  ' ': { 'pattern': ' ',  'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
" \  '=': { 'pattern': '===\|<=>\|\(&&\|||\|<<\|>>\)=\|=\~[#?]\?\|=>\|[:+/*!%^=><&|.-]\?=[#?]\?', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
" \  ':': { 'pattern': ':',  'left_margin': 0, 'right_margin': 1, 'stick_to_left': 1 },
" \  ',': { 'pattern': ',',  'left_margin': 0, 'right_margin': 1, 'stick_to_left': 1 },
" \  '|': { 'pattern': '|',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
" \  '.': { 'pattern': '\.', 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
" \  '#': { 'pattern': '#\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
" \  '&': { 'pattern': '\\\@<!&\|\\\\', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
" \  '{': { 'pattern': '(\@<!{', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
" \  '}': { 'pattern': '}',  'left_margin': 1, 'right_margin': 0, 'stick_to_left': 0 }
" \ }

" ag.vim + unite.vim
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


" 基本設定 (参考 http://qiita.com/jnchito/items/5141b3b01bced9f7f48f)
set noswapfile                   " スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set ruler                        " カーソルが何行目の何列目に置かれているかを表示する
set cmdheight=2                  " コマンドラインに使われる画面上の行数
set laststatus=2                 " エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set statusline=%<%f\%m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']'}
set statusline+=%{fugitive#statusline()}
set statusline+=%=%l,%c%V%8P
set title                        " ウインドウのタイトルバーにファイルのパス情報等を表示する
set wildmenu                     " コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set showcmd                      " 入力中のコマンドを表示する
set smartcase                    " 小文字のみで検索したときに大文字小文字を無視する
set hlsearch                     " 検索結果をハイライト表示する
set background=dark              " 暗い背景色に合わせた配色にする
set expandtab                    " タブ入力を複数の空白入力に置き換える
set incsearch                    " 検索ワードの最初の文字を入力した時点で検索を開始する
set hidden                       " 保存されていないファイルがあるときでも別のファイルを開けるようにする
set list                         " 不可視文字を表示す
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
set nowrap                       " 行を折り返さない

"
" edit .vimrc
nnoremap <silent> <Space>vimrc  :tabnew ~/.vimrc<CR>
nnoremap <silent> <Space>srcvim :source ~/.vimrc<CR>

"
" Insertモードの<ESC>を<C-j><C-j>にバインド
inoremap <silent> <C-j><C-j> <ESC>:w<CR>
inoremap <silent> <C-k><C-k> <ESC>

"
" <esc><esc>で検索ハイライトを消す
nnoremap <silent> <ESC><ESC> :noh<CR>

"
" ウィンドウまわりのキーバインド

"
" タブまわりのキーバインド
nnoremap <silent> <TAB>c     :tabnew %<CR>
nnoremap <silent> <TAB>w     :tabclose<CR>
nnoremap <silent> <TAB><S-w> :tabonly<CR>
nnoremap <silent> <TAB>1     :tabn 1<CR>
nnoremap <silent> <TAB>2     :tabn 2<CR>
nnoremap <silent> <TAB>3     :tabn 3<CR>
nnoremap <silent> <TAB>4     :tabn 4<CR>
nnoremap <silent> <TAB>5     :tabn 5<CR>
nnoremap <silent> <TAB><TAB> :tabnext<CR>
nnoremap <silent> <TAB>k     :tabnext<CR>
nnoremap <silent> <TAB>j     :tabprevious<CR>

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

"
" 挿入モード時、ステータスラインの色を変更
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction
function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
