" ---- 基本的な設定 ----
" https://vim-jp.org/vimdoc-ja/options.html

set encoding=utf8 " エンコーディング (UTF8)
set nocompatible  " 互換モードをオフにする
set noswapfile    " スワップファイルを作成しない
set hidden        " ファイルが保存されていない時でも別のファイルを開けるようにする
set belloff=all   " ビープ音/ビジュアルベルを無効化

" 行頭/行末での移動をできるようにする
set whichwrap=b  " <BS>
set whichwrap+=s " <Space>
set whichwrap+=h " h
set whichwrap+=l " l
set whichwrap+=< " <Left>
set whichwrap+=> " <Right>
set whichwrap+=[ " 挿入/置換 <Left>
set whichwrap+=] " 挿入/置換 <Right>

 " クリップボード
set clipboard+=unnamed
set clipboard+=autoselect

" カラースキーム
colorscheme desert
set background=dark " 黒い背景に合わせた色を使う

" タイトル (ターミナル・ウィンドウに表示される)
"   %t: パスを除いたファイル名
set title
set titlestring=%t

" 行数
set number        " 左側に行数を表示する
set numberwidth=3 " デフォルトの桁数を3桁にする

" ステータスライン
"   %f: 相対ファイルパス
"   %y: ファイルタイプ
"   %m: 修正フラグ
"   %r: 読み込み専用フラグ
"   %h: ヘルプフラグ
"   %w: プレビューウィンドウフラグ
"   %l: カーソルのある行数
"   %c: カーソルのある列数
"   %P: ファイル内の何％の位置か
"   %L: ファイルの総行数
set laststatus=2                    " 2: 常に表示する
set statusline=%<%f\ %y%m%r%h%w    " ステータスライン(左側)
set statusline+=%=%l,%c\ %4P\ [%LL] " ステータスライン(右側)

" コマンド行
set cmdheight=2 " コマンド行の表示行数
set wildmenu    " <Tab>での補完を有効化
set showcmd     " コマンド, 選択領域サイズを表示

" シンタックスハイライト
syntax on

" 不可視文字を可視化する
set list                  " 不可視文字の可視化
set listchars=tab:>\      " \tの可視化

" 行の折り返し
set nowrap                " 行を折り返さない
set listchars+=extends:>  " 右に表示されていない文字がある場合の表示
set listchars+=precedes:< " 左に表示されていない文字がある場合の表示

" インデント
set expandtab      " \tの代わりにスペースを使う
set smarttab       " 先頭のスペース内でタブを押した場合はスペースに展開
set tabstop=2      " \tの表示幅はスペース2つ
set shiftwidth=2   " インデント幅はスペース2つ
set autoindent     " 改行時に前の行のインデントを継続する
set smartindent    " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set cinoptions=l1  " caseラベルそのもの基準にインデントする
set cinoptions+=g0 " C++のスコープ宣言(public: など)をインデントしない
set cinoptions+=(0 " 閉じていない丸括弧内でのインデントをしない
set cinoptions+=Ws " 閉じていない丸括弧が行末にある時、前の行の先頭からインデントする
set cinoptions+=m1 " 閉じ括弧の位置を開き括弧がある行の先頭に揃える
filetype indent on " ファイル形式別のインデントファイルのロードを有効化する

" バックスペース
set backspace=indent " インデントの削除の際には1段分消す
set backspace+=eol   " 行頭での削除は行を連結する
set backspace+=start " 挿入モードでの CTRL-W と CTRL-U は行頭で止める

" 検索
set smartcase " 大文字小文字を区別しない
set hlsearch  " 検索結果をハイライト
set incsearch " インクリメンタルサーチを有効にする

" ウィンドウ
set splitright " 垂直方向に分割する際に新しいウィンドウを右側に置く
set splitbelow " 水平方向に分割する際に新しいウィンドウを下側に置く


" ---- Plugins ----

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin(expand('~/.vim/dein'))
  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

  " denite
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('jsfaint/gen_tags.vim')
  call dein#add('ozelentok/denite-gtags')

  " rails
  call dein#add('tpope/vim-rails')

  " text editing
  call dein#add('tpope/vim-surround')
  call dein#add('mattn/emmet-vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('dhruvasagar/vim-table-mode')

  " syntax highlight
  call dein#add('plasticboy/vim-markdown')
  call dein#add('othree/html5.vim')
  call dein#add('slim-template/vim-slim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('pangloss/vim-javascript')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('mxw/vim-jsx')
  call dein#add('leafgarland/typescript-vim')

  " visualization
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('vim-scripts/AnsiEsc.vim')
  call dein#add('luochen1990/rainbow')

  " editorconfig for vim
  call dein#add('editorconfig/editorconfig-vim')

  call dein#end()
  call dein#save_state()
endif

" denite.nvim settings
let g:gen_tags#gtags_default_map = 0
let g:gen_tags#use_cache_dir = 0
let g:gen_tags#gtags_auto_gen = 1
let g:gen_tags#gtags_auto_update = 1
let g:gen_tags#statusline = 1

if executable('ag')
  call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

call denite#custom#map('normal', '<Up>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')

call denite#custom#source('grep', 'matchers', ['matcher/substring'])
call denite#custom#source('gtags_gtags_completion', 'matchers', ['matcher/substring'])
call denite#custom#source('gtags_context', 'matchers', ['matcher/substring'])
call denite#custom#source('gtags_file', 'matchers', ['matcher/substring'])

call denite#custom#option('_', { 'direction': 'topleft', 'smartcase': v:true })
call denite#custom#option('search', { 'empty': v:false })

nnoremap <silent> ,p :Denite buffer<CR>
nnoremap <silent> ,n :Denite file/rec<CR>
nnoremap <silent> ,z :Denite file_mru<CR>
nnoremap <silent> ,g :Denite grep -buffer-name=search<CR>
nnoremap <silent> ,r :Denite grep -buffer-name=search -resume<CR>
nnoremap <silent> ,t :Denite gtags_completion<CR>
nnoremap <silent> ,d :DeniteCursorWord gtags_context -buffer-name=tag -immediately-1=true<CR>
nnoremap <silent> ,e :Denite gtags_context -buffer-name=tag -resume<CR>
nnoremap <silent> ,o :Denite gtags_file<CR>
nnoremap <silent> ,h :Denite help<CR>

" vim-rails settings
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings = 1
let g:rails_modelines = 0
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

" vim-easy-align settings
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-table-mode settings
au FileType markdown let g:table_mode_corner="|"

" vim-markdown settings
au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1

" vim-jsx settings
let g:jsx_ext_required = 0

" vim-indent-guides settings
let g:indent_guides_enable_on_vim_startup=1

" rainbow settings
let g:rainbow_active = 1


" ---- commands and key maping ----

" ファイルを閉じた時のカーソル位置を復元
augroup RestoreCurPos
  autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END

" Open help in vertical splited window
autocmd FileType help wincmd L

" Insertモードの<ESC>を<C-j><C-j>にバインド
inoremap <silent> <C-j><C-j> <ESC>

" 検索ハイライトを消す
nnoremap <silent> <C-l><C-l> :noh<CR>

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

" TableModeをToggle
nnoremap <silent> <C-t> :TableModeToggle<CR>i

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
      let current = matchstr(getline('.'), '.', col('.')-1, 1)
      if prev == bracket.initial && current == bracket.final
        call feedkeys("\<Right>\<BS>\<CR>" . bracket.final . "\<ESC>O", "n")
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
\  { "initial" : "'",  "final" : "'"  },
\  { "initial" : "`",  "final" : "`"  }
\]
function! AutoCompleteDeletePair()
  if g:enable_auto_complete != 0
    for pair in g:auto_complete_delete_pairs
      let prev    = matchstr(getline('.'), '.', col('.')-2, 1)
      let current = matchstr(getline('.'), '.', col('.')-1, 1)
      if prev == pair.initial && current == pair.final
        call feedkeys("\<Right>\<BS>\<BS>", "n")
        return ""
      endif
    endfor
    for pair in g:auto_complete_delete_pairs
      let prev    = matchstr(getline('.'), '.', col('.')-3, 1)
      let current = matchstr(getline('.'), '.', col('.')-2, 1)
      if prev == pair.initial && current == pair.final
        call feedkeys("\<BS>\<BS>", "n")
        return ""
      endif
    endfor
  endif
  call feedkeys("\<BS>", "n")
  return ""
endfunction
inoremap <silent> <BS> <C-R>=AutoCompleteDeletePair()<CR>

" split vertically with :terminal command
command Vterm :vertical terminal
cabbrev terminal Vterm
cabbrev term Vterm
