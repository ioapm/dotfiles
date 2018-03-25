" vim: set foldmethod=marker foldlevel=0:
" ============================================================================
"
"               ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"               ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"               ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"               ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"               ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"               ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"
" ============================================================================

let s:darwin = has('mac')

let g:nvim_dir = expand('~/.config/nvim')
let g:plug_dir = g:nvim_dir.'/plugged'

" ============================================================================
"  vim-plug {{{
" ============================================================================
"
" @see https://github.com/junegunn/vim-plug
"
" > curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
" >     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"

silent! if plug#begin(g:plug_dir)

let $GIT_SSL_NO_VERIFY = 'true'

" <3 packages
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimfiler',    { 'on': ['VimFiler', 'VimFilerExplorer', 'Edit', 'Read', 'Source', 'Write' ] }
Plug 'Shougo/vimproc.vim', { 'dir': g:plug_dir.'/vimproc.vim', 'do': 'make' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Filer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color scheme
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
Plug 'rhysd/github-complete.vim'

" Edit
Plug 'majutsushi/tagbar'
Plug 't9md/vim-choosewin'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-emoji'
Plug 'mattn/webapi-vim'
Plug 'joonty/vdebug'

" Programming
Plug 'othree/yajs.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale', { 'for': ['javascript', 'php'] }
Plug 'posva/vim-vue'

" Misc
Plug 'vim-jp/vimdoc-ja', { 'for': 'help' }
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'ryanoasis/vim-devicons'

call plug#end()
endif

" }}}
" ============================================================================
"  basic settings {{{
" ============================================================================

let mapleader = ','
let maplocalleader = ','

augroup vimrc
    autocmd!
augroup END

set encoding=utf-8
scriptencoding utf-8

set number                                   " 行数を表示
set cursorline                               " カーソル行の背景色を変える
set showcmd                                  " コマンドをステータス行に表示
set noshowmode                               " 現在のモードを表示
set laststatus=2                             " ステータス行を常時表示
set cmdheight=2                              " メッセージ表示欄を2行確保
set showmatch                                " 対応する括弧を表示
set list                                     " 不可視文字を表示
set listchars=tab:›\ ,eol:↲,extends:»,precedes:«,nbsp:¯,trail:␣
set backspace=indent,eol,start               " バックスペースでなんでも消せるように
                                             " `%` で移動するペアを全角文字にも拡張する
set matchpairs+=（:）,「:」,【:】,［:］,｛:｝,＜:＞
set wrap                                     " ウィンドウの幅が足りないときは折り返す
set breakindent                              " 折り返し時にインデントする
set showbreak=››                             " 折り返したときに行頭にマークを表示する
set whichwrap=b,s,h,l,<,>,[,]                " カーソルを行頭、行末で止まらないようにする
set scrolloff=3                              " 上下の画面の端にカーソルを寄せない。
set sidescrolloff=5                          " 左右の画面の端にカーソルを寄せない。
set confirm                                  " 保存していないファイルを閉じる際に確認を促す
set autoread                                 " 他で書き換えられたら自動で読み直す
set nobackup                                 " バックアップ取らない
set noswapfile                               " スワップファイル作らない
set hidden                                   " 編集中でも他のファイルを開けるようにする
set modelines=0                              " モードラインは無効
set hlsearch                                 " 検索結果をハイライトする
set incsearch                                " インクリメンタルサーチを有効にする
set ignorecase                               " 大文字小文字を区別しない
set wrapscan                                 " 催行日まで検索を終えたら先頭に戻る
set autoindent                               " インデントを自動で揃える
set smartindent                              " 前の行末に応じてインデントを調整する
set tabstop=4                                " 表示タブ幅=4
set shiftwidth=4                             " 自動インデントタブ幅=4
set expandtab                                " タブではなくスペースでインデントする
set textwidth=0                              " 一行に長い文章を書いていても自動折り返しをしない
set formatoptions=lmoq                       " テキスト整形オプション，マルチバイト系を追加
set visualbell t_vb=                         " ビープをならさない
set browsedir=buffer                         " Exploreの初期ディレクトリ
set viminfo='50,<1000,s100,\"50              " viminfoファイルの設定
set clipboard=unnamed,unnamedplus            " クリップボード
set mouse=a                                  " すべてのモードでマウス操作を有効にする
set guioptions+=a                            " ビジュアルモードの選択行をクリップボードに保存する
set ttyfast                                  " ターミナル接続を高速化
set t_Co=256                                 " 256色表示
set lazyredraw                               " 画面描画をできるだけ遅らせる
                                             " エンコーディング
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformat=unix                          " 改行コード指定
set fileformats=unix,dos,mac                 " 改行コード自動認識

set shell=sh                                 " Shell実行時はshを強制

syntax on                                    " 構文に応じたカラー表示にする

                                             " カーソル行をハイライトする
highlight CursorLine cterm=NONE ctermfg=blue ctermbg=black

" }}}
" ============================================================================
" key mappings {{{
" ============================================================================

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>

" ----------------------------------------------------------------------------
" Unite.vim
" ----------------------------------------------------------------------------
nnoremap [unite]  <NOP>
nmap     <Space>  [unite]

" ファイル一覧
nnoremap <silent> [unite]l <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイル一覧
nnoremap <silent> [unite]m <ESC>:<C-u>Unite file_mru<CR>
" タブ一覧
nnoremap <silent> [unite]t <ESC>:<C-u>Unite tab<CR>
" バッファ一覧
nnoremap <silent> [unite]k <ESC>:<C-u>Unite buffer<CR>
" レジスタ一覧
nnoremap <silent> [unite]r <ESC>:<C-u>Unite -buffer-name=register register<CR>
" Unite grep
nnoremap <silent> [unite]g <ESC>:<C-u>Unite grep:. -wrap -buffer-name=search-buffer<CR>
" Unite cursor word grep
nnoremap <silent> [unite]w <ESC>:<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" Unite grepの結果の再呼び出し
nnoremap <silent> [unite]h <ESC>:<C-u>UniteResume search-buffer<CR>
" ブックマーク追加
nnoremap <silent> [unite]b <ESC>:<C-u>UniteBookmarkAdd<CR>
" ブックマーク一覧
nnoremap <silent> [unite]B <ESC>:<C-u>Unite bookmark<CR>

" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

" ----------------------------------------------------------------------------
" fzf
" ----------------------------------------------------------------------------
nnoremap [unite]f   <Nop>
nnoremap <silent> [unite]f <ESC>:FZF<CR>

" ----------------------------------------------------------------------------
" choosewin
" ----------------------------------------------------------------------------
nmap  -  <Plug>(choosewin)

" ----------------------------------------------------------------------------
" Buffer
" ----------------------------------------------------------------------------
" 前のバッファに戻る
nnoremap [unite]p <ESC>:bprevious<CR>
" 次のバッファに進む
nnoremap [unite]n <ESC>:bnext<CR>

" ----------------------------------------------------------------------------
" Tag jump
" ----------------------------------------------------------------------------
nnoremap [tag]   <NOP>
nmap     <C-t>   [tag]

nnoremap [tag]j  <ESC>:<C-u>exe("tjump ".expand('<cword>'))<CR>
nnoremap [tag]p  <ESC>:<C-u>pop<CR>

" 新しいタブで開く
nnoremap [tag]n  <ESC>:<C-u>tab sp<CR> :exe("tjump ".expand('<cword>'))<CR>
" ウィンドウを縦分割して開く
nnoremap [tag]v  <ESC>:<C-u>vsp<CR> :exe("tjump ".expand('<cword>'))<CR>

" ----------------------------------------------------------------------------
" Window split
" ----------------------------------------------------------------------------
nnoremap _     <ESC>:sp<CR>
nnoremap <bar> <ESC>:vsp<CR>
" }}}

" ----------------------------------------------------------------------------
" <C-]> | Tag jump
" ----------------------------------------------------------------------------
nnoremap <C-]> g<C-]>

" ----------------------------------------------------------------------------
" Tab control
" ----------------------------------------------------------------------------
nnoremap T <ESC>:tabnew<CR>
nnoremap < gT
nnoremap > gt
nnoremap <space>q <ESC>:q<CR>

" ----------------------------------------------------------------------------
" <F1> | vimfiler/NERDTree
" ----------------------------------------------------------------------------
"nnoremap <F1> <ESC>:<C-u>VimFilerExplorer -winwidth=40<CR>
nnoremap <F1> :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" <F2> | Tagbar
" ----------------------------------------------------------------------------
inoremap <F2> <esc>:TagbarToggle<cr>
nnoremap <F2> :TagbarToggle<cr>
let g:tagbar_sort = 0

" ----------------------------------------------------------------------------
" <F4> | Tab close
" ----------------------------------------------------------------------------
nnoremap <F4> <ESC>:q<CR>

" }}}
" ============================================================================
" Functions & Commands {{{
" ============================================================================

" ----------------------------------------------------------------------------
" :Root | Change directory to the root of the Git repository
" ----------------------------------------------------------------------------
function! s:root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
command! Root call s:root()

" ----------------------------------------------------------------------------
" :Todo | List TODO
" ----------------------------------------------------------------------------
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -n -e TODO -e FIXME -e XXX 2> /dev/null',
            \ 'grep -rn -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()

" }}}
" ============================================================================
" Color Scheme {{{
" ============================================================================

" ----------------------------------------------------------------------------
" seoul256
" ----------------------------------------------------------------------------
"colo seoul256
"
"let g:seoul256_background = 233
"let g:seoul256_light_background = 256

" ----------------------------------------------------------------------------
" OceanicNext
" ----------------------------------------------------------------------------
colo OceanicNext

let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_terminal_bold = 1

" }}}
" ============================================================================
" Plugins {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Unite.vim
" ----------------------------------------------------------------------------
let g:unite_force_overwrite_statusline       = 0
let g:unite_kind_jump_list_after_jump_scroll = 0
let g:unite_enable_start_insert              = 0
let g:unite_source_rec_min_cache_files       = 1000
let g:unite_source_rec_max_cache_files       = 5000
let g:unite_source_file_mru_long_limit       = 100000
let g:unite_source_file_mru_limit            = 100000
let g:unite_source_directory_mru_long_limit  = 100000
let g:unite_prompt                           = '>> '

function! s:unite_my_settings()
    " ウィンドウを分割して開く
    au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')

    " ウィンドウを縦に分割して開く
    au FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('vsplit')
    au FileType unite inoremap <silent> <buffer> <expr> <C-k> unite#do_action('vsplit')

    " ESCキーを2回押すと終了する
    au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
    au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
endfunction

augroup UniteMySettings
    autocmd!
    autocmd FileType unite call s:unite_my_settings()
augroup END

call unite#custom#profile('default', 'context', {'start_insert': 1})

if executable('rg')
  let g:unite_source_grep_command = 'rg'
  let g:unite_source_grep_default_opts = '--no-heading --vimgrep -S'
  let g:unite_source_grep_recursive_opt = ''
endif

" ----------------------------------------------------------------------------
" airline
" ----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'

cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'

let g:airline#extensions#tabline#buffer_idx_mode = 1

" ----------------------------------------------------------------------------
" tagbar
" ----------------------------------------------------------------------------
let g:tagbar_width = 35 "(default 40)

" ----------------------------------------------------------------------------
" vimfiler
" ----------------------------------------------------------------------------
""let g:vimfiler_as_default_explorer        = 1
""let g:vimfiler_safe_mode_by_default       = 0
""let g:vimfiler_force_overwrite_statusline = 0
""
""let g:webdevicons_enable = 1
""let g:webdevicons_enable_vimfiler         = 0
""
""autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
let NERDTreeMapJumpFirstChild = ''

let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = ' '
let g:vimfiler_marked_file_icon = '*'

augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
set wildmenu
set wildmode=list:longest

nnoremap [git]  <Nop>
nmap     ;      [git]

nnoremap <silent> [git]b <ESC>:Gblame<CR>
nnoremap <silent> [git]d <ESC>:Gdiff<CR>
nnoremap <silent> [git]s <ESC>:Gstatus<CR>

" ----------------------------------------------------------------------------
" gv.vim
" ----------------------------------------------------------------------------
function! s:gv_expand()
  let line = getline('.')
  GV --name-status
  call search('\V'.line, 'c')
  normal! zz
endfunction

nnoremap <silent> [git]v <ESC>:GV<CR>

autocmd! FileType GV nnoremap <buffer> <silent> + :call <sid>gv_expand()<cr>

" ----------------------------------------------------------------------------
" vim-signify
" ----------------------------------------------------------------------------
let g:signify_vcs_list = ['git']
let g:signify_skip_filetype = { 'journal': 1 }

" ----------------------------------------------------------------------------
" vim-emoji
" ----------------------------------------------------------------------------
function! s:replace_emojis() range
  for lnum in range(a:firstline, a:lastline)
    let line = getline(lnum)
    let subs = substitute(line,
          \ ':\([^:]\+\):', '\=emoji#for(submatch(1), submatch(0))', 'g')
    if line != subs
      call setline(lnum, subs)
    endif
  endfor
endfunction
command! -range EmojiReplace <line1>,<line2>call s:replace_emojis()

set completefunc=emoji#complete

" ----------------------------------------------------------------------------
" deoplete
" ----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:deoplete#omni_patterns.markdown = ''
let g:deoplete#omni_patterns.gitcommit = ''

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

" 補完する際にプレビューを表示しない
set completeopt-=preview

" 補完を確定した際にプレビューを閉じる
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ----------------------------------------------------------------------------
" choosewin
" ----------------------------------------------------------------------------
let g:choosewin_overlay_enable = 1

" ----------------------------------------------------------------------------
"  editorconfig
" ----------------------------------------------------------------------------
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
let g:EditorConfig_core_mode = 'external_command'

" ----------------------------------------------------------------------------
"  vdebug
" ----------------------------------------------------------------------------

let g:vdebug_force_ascii = 1

let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<F6>",
\    "step_over" : "<F10>",
\    "step_into" : "<F11>",
\    "step_out" : "<F12>",
\    "close" : "<F3>",
\    "detach" : "<F4>",
\    "set_breakpoint" : "<F7>",
\    "get_context" : "<F8>",
\    "eval_under_cursor" : "<F9>",
\    "eval_visual" : "<Leader>e"
\}

" }}}
" ============================================================================
" fzf {{{
" ============================================================================

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" File preview using Highlight (http://www.andre-simon.de/doku/highlight/en/highlight.php)
let g:fzf_files_options =
  \ '--preview "highlight -O ansi {} ;or cat {} 2> /dev/null"'

" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

command! Plugs call fzf#run({
  \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
  \ 'options': '--ansi --multi --delimiter / --nth -1'
  \ 'down':    '~40%',
  \ 'sink':    'Explore'})

" ----------------------------------------------------------------------------
"  ALE
" ----------------------------------------------------------------------------

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'php': ['phpcs'],
\}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" }}}
" ============================================================================
" AUTOCMD {{{
" ============================================================================

" vim-vue
autocmd FileType vue syntax sync fromstart

" }}}

