""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" 参考 http://qiita.com/jnchito/items/5141b3b01bced9f7f48f
set nocompatible
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Plugins Instllation
filetype off
if has('vim_starting')
  set rtp+=$HOME/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" vimproc
NeoBundle 'Shougo/vimproc.vim', {
\   'build': {
\     'windows': 'tools\\update-dll-mingw',
\     'cygwin':  'make -f make_cygwin.mak',
\     'mac':     'make',
\     'linux':   'make',
\     'unix':    'gmake',
\   },
\ }

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite-outline'

NeoBundle 'tpope/vim-fugitive'              " Git
NeoBundle 'tpope/vim-rails'                 " Rails
NeoBundle 'thinca/vim-quickrun'             " run code on vim

NeoBundle 'rking/ag.vim'                    " grep search
NeoBundle 'tpope/vim-surround'              " adding text object 'surroundings'
NeoBundle 'mattn/emmet-vim'                 " support coding html
NeoBundle 'junegunn/vim-easy-align'         " support alignment
NeoBundle 'tomtom/tcomment_vim'             " support comment out/in

" syntax
NeoBundle 'hail2u/vim-css3-syntax'          " CSS3
NeoBundle 'othree/html5.vim'                " html5
NeoBundle 'pangloss/vim-javascript'         " JavaScript
NeoBundle 'kchmck/vim-coffee-script'        " CoffeeScript
NeoBundle 'mxw/vim-jsx'                     " JSX
NeoBundle 'slim-template/vim-slim'          " slim
NeoBundle 'plasticboy/vim-markdown'         " Markdown

" visualization
NeoBundle 'nathanaelkane/vim-indent-guides' " visualize indent
NeoBundle 'bronson/vim-trailing-whitespace' " visualize whitespace
NeoBundle 'vim-scripts/AnsiEsc.vim'         " coloring log file

" Twitter on vim
NeoBundle 'mattn/webapi-vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'basyura/TweetVim'

call neobundle#end()
filetype plugin indent on

"
" unit.vim
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"
" unite-outline
let g:unite_data_directory='.vim/bundle/unite-outline/'
let g:unite_abbr_highlight='normal'

"
" VimFiler
nnoremap <silent> <C-e> :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle<CR>

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

" Easy Align
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

" markdown
au BufRead,BufNewFile *.md set filetype=markdown


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key maping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" edit .vimrc
nnoremap <silent> <Space>vimrc  :tabnew ~/.vimrc<CR>
nnoremap <silent> <Space>srcvim :source ~/.vimrc<CR>

"
" Insertモードの<ESC>を<C-j><C-j>にバインド
inoremap <silent> <C-j><C-j> <ESC>:w<CR>
inoremap <silent> <C-k><C-k> <ESC>

"
" 検索ハイライトを消す
nnoremap <silent> <C-l><C-l> :noh<CR>

"
" Insert with no paste
nnoremap ,i :<C-u>set paste<Return>i
autocmd InsertLeave * set nopaste

" 行数の表示をtoggle
function! s:Setnumber()
  if &number
    setlocal nonumber
  else
    setlocal number
  endif
endfunction
nnoremap <silent> <C-m><C-m> :call Setnumber()<CR>

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
" タブの移動
function! s:MoveTabpage(num)
  if type(a:num) != type(0)
    return
  endif
  let pos = tabpagenr() - 1 + a:num
  let tabcount = tabpagenr("$")
  if pos < 0
    let pos = tabcount - 1
  elseif pos >= tabcount
    let pos = 0
  endif
  execute "tabmove " . pos
endfunction
nnoremap <silent> <TAB><Right> :call MoveTabpage(1)<CR>
nnoremap <silent> <TAB><Left>  :call MoveTabpage(-1)<CR>

"
" ファイルを閉じるときにカーソル位置を記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
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
