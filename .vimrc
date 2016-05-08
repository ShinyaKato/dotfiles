""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" 参考 http://qiita.com/jnchito/items/5141b3b01bced9f7f48f
set nocompatible                 " vi互換モードをOffに
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
set visualbell t_vb=             " ビープ音/ビジュアルベルを無効化


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Plugins Instllation with NeoBundle
filetype off
if has('vim_starting')
  set rtp+=$HOME/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

"
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

"
" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
" NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'rking/ag.vim'
" basic settings
let g:unite_enable_start_insert=1
" outline
let g:unite_data_directory='.vim/bundle/unite-outline/'
let g:unite_abbr_highlight='normal'
" ag.vim
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
" Exit Unite
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" key mapping
nmap , [unite]
nnoremap <silent> [unite]p     :Unite buffer<CR>
nnoremap <silent> [unite]n     :Unite -buffer-name=file file<CR>
nnoremap <silent> [unite]<S-n> :UniteWithBufferDir file -buffer-name=file<CR>
nnoremap <silent> [unite]z     :Unite file_mru<CR>
nnoremap <silent> [unite]o     :Unite outline -vertical -winwidth=40 -direction=botright<CR>
nnoremap <silent> [unite]g     :Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]<S-g> :Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> [unite]r     :UniteResume search-buffer<CR>
" nnoremap <silent> [unite]e     :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle<CR>

"
" run code on vim
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : "vertical :botright",
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"
" Git
NeoBundle 'tpope/vim-fugitive'

"
" Rails
NeoBundle 'tpope/vim-rails'
" basic settings
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
" support coding
NeoBundle 'tpope/vim-surround'              " adding text object 'surroundings'
NeoBundle 'mattn/emmet-vim'                 " support coding html
NeoBundle 'junegunn/vim-easy-align'         " support alignment
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
NeoBundle 'tomtom/tcomment_vim'             " support comment out/in

"
" syntax
NeoBundle 'plasticboy/vim-markdown'         " Markdown
au BufRead,BufNewFile *.md set filetype=markdown
NeoBundle 'othree/html5.vim'                " html5
NeoBundle 'slim-template/vim-slim'          " html.slim
NeoBundle 'jwalton512/vim-blade'            " blade.php
NeoBundle 'hail2u/vim-css3-syntax'          " CSS3
NeoBundle 'pangloss/vim-javascript'         " JavaScript
NeoBundle 'kchmck/vim-coffee-script'        " CoffeeScript
NeoBundle 'mxw/vim-jsx'                     " JSX
let g:jsx_ext_required = 0

"
" visualization
NeoBundle 'nathanaelkane/vim-indent-guides' " visualize indent
let g:indent_guides_enable_on_vim_startup=1
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commands, key maping, etc...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" edit .vimrc / help
command! -nargs=0 Vimrc :tabnew ~/.vimrc
command! -nargs=0 Reload :source ~/.vimrc
au FileType help nnoremap <silent> <buffer> <Esc><Esc> :q<CR>

"
" Insertモードの<ESC>を<C-j><C-j>にバインド
inoremap <silent> <C-j><C-j> <ESC>:w<CR>

"
" 検索ハイライトを消す
nnoremap <silent> <C-l><C-l> :noh<CR>

"
" Insert with no paste
nnoremap ,i :<C-u>set paste<Return>i
autocmd InsertLeave * set nopaste

" 行数の表示をtoggle
function! Setnumber()
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
function! MoveTabpage(num)
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
command! -nargs=1 MoveTabpage :call MoveTabpage(<f-args>)
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

"
" クォーテーション/括弧を自動補完
let g:enable_auto_complete = 1
function! AutoCompleteToggle()
  if g:enable_auto_complete == 0
    silent let g:enable_auto_complete = 1
    echo "enabled AutoComplete"
  else
    silent let g:enable_auto_complete = 0
    echo "disabled AutoComplete"
  endif
endfunction
command! -nargs=0 AutoCompleteToggle :call AutoCompleteToggle()
" クォーテーション
function! AutoCompleteQuote(char)
  if g:enable_auto_complete != 0
    if matchstr(getline('.'), '.', col('.')-1, 1) != a:char
      call feedkeys(a:char . a:char . "\<Left>", "n")
    else
      call feedkeys("\<Right>", "n")
    endif
  else
    call feedkeys(a:char, "n")
  endif
  return ""
endfunction
inoremap <silent> ' <C-R>=AutoCompleteQuote("'")<CR>
inoremap <silent> " <C-R>=AutoCompleteQuote("\"")<CR>
inoremap <silent> ` <C-R>=AutoCompleteQuote("`")<CR>
" 括弧
function! AutoCompleteBracket(char, initial, final)
  if g:enable_auto_complete != 0
    if a:char == a:initial
      call feedkeys(a:initial . a:final . "\<Left>", "n")
    elseif a:char == a:final
      if matchstr(getline('.'), '.', col('.')-1, 1) == a:final
        call feedkeys("\<Right>", "n")
      else
        call feedkeys(a:final, "n")
      end
    else
      echoerr "First arguments should be one of latter two arguments. See key mapping using 'AutoCompleteBracket(\"" . a:char . "\", \"" . a:initial . "\", \"" . a:final . "\")'"
    end
  else
    call feedkeys(a:char, "n")
  end
  return ""
endfunction
inoremap <silent> ( <C-R>=AutoCompleteBracket("(", "(", ")")<CR>
inoremap <silent> ) <C-R>=AutoCompleteBracket(")", "(", ")")<CR>
inoremap <silent> { <C-R>=AutoCompleteBracket("{", "{", "}")<CR>
inoremap <silent> } <C-R>=AutoCompleteBracket("}", "{", "}")<CR>
inoremap <silent> [ <C-R>=AutoCompleteBracket("[", "[", "]")<CR>
inoremap <silent> ] <C-R>=AutoCompleteBracket("]", "[", "]")<CR>
au FileType html inoremap <silent> <buffer> < <C-R>=AutoCompleteBracket("<", "<", ">")<CR>
au FileType html inoremap <silent> <buffer> > <C-R>=AutoCompleteBracket(">", "<", ">")<CR>
" 空の括弧の中でenterした時にインデントを整形する
let g:auto_complete_indented_brackets = [
\  { "initial" : "(", "final" : ")" },
\  { "initial" : "{", "final" : "}" },
\  { "initial" : "[", "final" : "]" }
\]
function! AutoCompleteIndentBrackets()
  if g:enable_auto_complete != 0
    for bracket in g:auto_complete_indented_brackets
      let prev    = matchstr(getline('.'), '.', col('.')-2, 1)
      let current = matchstr(getline('.'), '.', col('.')-1 , 1)
      if prev == bracket.initial && current == bracket.final
        " call feedkeys("\<Right>\<BS>\<CR>", "n")
        call feedkeys("\<CR>\<CR>\<Up>\<Tab>", "n")
        return ""
      endif
    endfor
  endif
  call feedkeys("\<CR>", "n")
  return ""
endfunction
inoremap <silent> <CR> <C-R>=AutoCompleteIndentBrackets()<CR>
" 空の補完文字の中でdeleteした時に閉じクォート/閉じ括弧も削除する
let g:auto_complete_delete_pairs = [
\  { "initial" : "(",  "final" : ")"  },
\  { "initial" : "{",  "final" : "}"  },
\  { "initial" : "[",  "final" : "]"  },
\  { "initial" : "<",  "final" : ">"  },
\  { "initial" : "\"", "final" : "\"" },
\  { "initial" : "'",  "final" : "."  },
\  { "initial" : "`",  "final" : "`"  }
\]
function! AutoCompleteDeletePair()
  if g:enable_auto_complete != 0
    for pair in g:auto_complete_delete_pairs
      let prev    = matchstr(getline('.'), '.', col('.')-2, 1)
      let current = matchstr(getline('.'), '.', col('.')-1 , 1)
      if prev == pair.initial && current == pair.final
        call feedkeys("\<Right>\<BS>\<BS>", "n")
        return ""
      endif
    endfor
  endif
  call feedkeys("\<BS>", "n")
  return ""
endfunction
inoremap <silent> <BS> <C-R>=AutoCompleteDeletePair()<CR>

"
" PHP: include HTML indentation
" REF: http://vim.wikia.com/wiki/Better_indent_support_for_php_with_html
" Better indent support for PHP by making it possible to indent HTML sections as well.
function! GetPhpHtmlIndent(lnum)
  if exists('*HtmlIndent')
    let html_ind = HtmlIndent()
  else
    let html_ind = HtmlIndentGet(a:lnum)
  endif
  let php_ind = GetPhpIndent()
  " priority one for php indent script
  if php_ind > -1
    return php_ind
  endif
  if html_ind > -1
    if getline(a:num) =~ "^<?" && (0< searchpair('<?', '', '?>', 'nWb')
          \ || 0 < searchpair('<?', '', '?>', 'nW'))
      return -1
    endif
    return html_ind
  endif
  return -1
endfunction
function! EnablePhpHtmlIndent()
  " This script pulls in the default indent/php.vim with the :runtime command
  " which could re-run this script recursively unless we catch that:
  if exists('s:doing_indent_inits')
    echo 12
    return
  endif
  let s:doing_indent_inits = 1
  runtime! indent/html.vim
  unlet b:did_indent
  runtime! indent/php.vim
  unlet s:doing_indent_inits
  setlocal indentexpr=GetPhpHtmlIndent(v:lnum)
  setlocal indentkeys+=<>>
endfunction
au FileType php,blade call EnablePhpHtmlIndent()"

