set nocompatible

if empty(glob('$HOME/.vim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $VIMRC
endif

call plug#begin('$HOME/.vim/plugged')
" interface
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'jdkanani/vim-material-theme'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" tree views
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" omnicompletion
" Plug 'slashmili/alchemist.vim'
" Plug 'Rip-Rip/clang_complete'
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" Plug 'Quramy/tsuquyomi'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'racer-rust/vim-racer'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --tern-completer --racer-completer' }
Plug 'natebosch/vim-lsc'

" others
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'metakirby5/codi.vim'
Plug 'junegunn/fzf', { 'dir': '$HOME/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
" Plug 'neomake/neomake'
" Plug 'nightsense/night-and-day'
Plug 'mtth/scratch.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-grepper'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'haya14busa/vim-operator-flashy'
Plug 'kana/vim-operator-user'

" syntax
Plug 'cespare/dtd.vim'
Plug 'cespare/mxml.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'hdima/python-syntax'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'jeroenbourgois/vim-actionscript'
Plug 'gbrlsnchs/vim-coldfusion'
Plug 'chemzqm/vim-jsx-improve'
" Plug 'sheerun/vim-polyglot'
Plug 'vitalk/vim-shebang'
Plug 'cespare/vim-toml'

" editorconfig
Plug 'editorconfig/editorconfig-vim'
call plug#end()

filetype plugin indent on
syntax enable

set hidden
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set ttimeoutlen=50
set number
set bs=2
set columns=80
set textwidth=0
set wrapmargin=0
set wrap
set ruler
set encoding=utf-8
set showtabline=2
set directory=$HOME/.vim/swapfiles
" set t_Co=16
set t_Co=256
set nuw=7
set noshowmode
set showcmd
set background=dark
set pumheight=10
set nohlsearch
set omnifunc=syntaxcomplete#Complete
" set completeopt-=preview
" set indentkeys+=0
" set foldmethod=syntax

colorscheme solarized

command W execute 'w'
command Wq execute 'wq'
command WQ execute 'wq'

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Airline
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#show_message = 0
let g:airline_section_z = '%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#/%L:%3v'
let g:airline_theme='solarized'
let s:theme = readfile('/tmp/terminalrc')[0]
let g:airline_solarized_bg=s:theme

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
" let g:airline_symbols.notexists = ' '

" Auto Pairs
let g:AutoPairsMapCR = 0

" NERDTree
let g:NERDTreeWinSize = 40

" Python Syntax
let python_highlight_all = 1 

" Codi
let g:codi#log = '/tmp/codi_debug.log'

" Solarized
if s:theme ==# 'dark'
    let g:solarized_termcolors = 16
else
    let g:solarized_termcolors = 256
endif

" Startify
let g:startify_change_to_dir = 0
let g:startify_session_dir = '$HOME/.vim/sessions'
let g:startify_relative_path = 1

" Tagbar
" let g:tagbar_zoomwidth = 0
" let g:tagbar_autofocus = 1
let g:tagbar_fix = 0

" clang_complete
let g:clang_library_path = '/usr/lib/llvm-4.0/lib/libclang.so.1'

" rust.vim
let g:rustfmt_autosave = 1

" vim-racer
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let g:racer_experimental_completer = 1

" tsuquyomi
let g:tsuquyomi_completion_preview = 1
let g:tsuquyomi_disable_quickfix = 1

" syntastic
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:term_map_keys = 1
let g:term_show_argument_hints = 'on_hold'
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:go_fmt_fail_silently = 1

" Ale
let airline#extensions#ale#enabled = 1
let g:ale_linters = {'go': ['gometalinter', 'gofmt']}
let g:ale_go_gometalinter_options = '--fast -t --vendor --config=$HOME/.vim/gometalinter.json'
" let g:ale_fixers = {
"     \ 'go': ['gofmt'],
"     \ }
" let g:ale_fix_on_save = 1

" Neomake
" let g:neomake_cpp_clang_args = ['-std=c++14', '-Wextra', '-Wall', '-fsanitize=undefined', '-g']
" let g:neomake_java_javac_args = ['-sourcepath', '.:src:src/main/java', '-d', 'target']
" let g:neomake_typescript_tsc_maker = {
"             \ 'args': ['--project', neomake#utils#FindGlobFile('tsconfig.json'), '--noEmit'],
"             \ 'append_file': 0,
"             \ 'errorformat':
"                 \ '%E%f %#(%l\,%c): error %m,' .
"                 \ '%E%f %#(%l\,%c): %m,' .
"                 \ '%Eerror %m,' .
"                 \ '%C%\s%\+%m',
"             \ 'exe': neomake#utils#FindGlobFile('node_modules/.bin/tsc')
"             \ }

" Markdown Preview
let g:vim_markdown_preview_github = 1
let g:vim_markdown_preview_hotkey = '<C-m>'

" Notes
let g:notes_directories = ['~/Documents/Notes']

" Time Scheduler
let g:nd_themes = [
            \ ['6:00', 'solarized', 'light'],
            \ ['18:00', 'solarized', 'dark'],
            \ ]

" let g:lsc_server_commands = {
"             \ 'go': 'go-langserver'
"             \ }
let g:lsc_enable_autocomplete = v:false

" Custom Theme
" Vim Operator Flashy
" hi Flashy ctermbg=darkgrey ctermfg=grey
" hi Visual ctermbg=darkgray ctermfg=grey
" hi MatchParen ctermbg=grey ctermfg=darkyellow
" hi StartifyPath ctermfg=blue
" hi StartifyHeader cterm=bold ctermfg=darkgreen
" hi NERDTreeGitStatusDirDirty ctermfg=darkred
" hi NERDTreeDir ctermfg=darkgreen
" hi NERDTreeOpenable ctermfg=white
" hi NERDTreeClosable ctermfg=white
" hi CursorLine cterm=none
" hi NeomakeErrorSign ctermfg=darkred
" hi PmenuSel ctermbg=grey
" hi PmenuThumb ctermbg=darkgrey
" hi Search ctermbg=darkyellow ctermfg=black
" hi qfFileName ctermfg=darkred
" hi DiffAdd ctermbg=darkgreen ctermfg=black
" hi DiffChange ctermbg=none ctermfg=none
" hi DiffDelete ctermbg=darkred ctermfg=white
" hi DiffText ctermbg=darkyellow ctermfg=white

" fzf
" let g:fzf_colors =
"             \ { 'fg':      ['fg', 'Normal'],
"             \ 'bg':      ['bg', 'Normal'],
"             \ 'hl':      ['fg', 'Comment'],
"             \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"             \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"             \ 'hl+':     ['fg', 'Statement'],
"             \ 'info':    ['fg', 'PreProc'],
"             \ 'prompt':  ['fg', 'Conditional'],
"             \ 'pointer': ['fg', 'Exception'],
"             \ 'marker':  ['fg', 'Keyword'],
"             \ 'spinner': ['fg', 'Label'],
"             \ 'header':  ['fg', 'Comment'] }

" function! s:update_fzf_colors()
"     let rules =
"                 \ { 'fg':      [['Normal',       'fg']],
"                 \ 'bg':      [['Normal',       'bg']],
"                 \ 'hl':      [['Comment',      'fg']],
"                 \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
"                 \ 'bg+':     [['CursorColumn', 'bg']],
"                 \ 'hl+':     [['Statement',    'fg']],
"                 \ 'info':    [['PreProc',      'fg']],
"                 \ 'prompt':  [['Conditional',  'fg']],
"                 \ 'pointer': [['Exception',    'fg']],
"                 \ 'marker':  [['Keyword',      'fg']],
"                 \ 'spinner': [['Label',        'fg']],
"                 \ 'header':  [['Comment',      'fg']] }
"     let cols = []
"     for [name, pairs] in items(rules)
"         for pair in pairs
"             let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
"             if !empty(name) && code > 0
"                 call add(cols, name.':'.code)
"                 break
"             endif
"         endfor
"     endfor
"     let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
"     let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
"                 \ empty(cols) ? '' : (' --color='.join(cols, ','))
" endfunction

" augroup _fzf
"     autocmd!
"     autocmd ColorScheme * call <SID>update_fzf_colors()
" augroup END

augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

augroup gitcommit
    autocmd!
    autocmd FileType gitcommit set nobuflisted
augroup END

function s:RemapBuffers()
    if &l:buftype ==# 'nofile'
        set nobuflisted

        if !empty(mapcheck('<Tab>'))
            nunmap <Tab>
            nunmap <S-Tab>
            nunmap <Leader>bd
            nunmap <Leader>bD
        endif
    else
        nmap <silent> <Tab> :bn<CR>
        nmap <silent> <S-Tab> :bp<CR>
        nmap <silent> <Leader>bd :Bd<CR>
        nmap <silent> <Leader>bD :bd<CR>
    endif
endfunction

function s:FixAirlineFromTagbar()
    if g:tagbar_fix == 0
        :AirlineTheme solarized

        let g:tagbar_fix = 1
    endif
endfunction

function s:AllowCodi()
   if empty(glob('/tmp/cmd'))
       call system('touch /tmp/cmd')
   endif

   call system('chmod u+x /tmp/cmd')
endfunction

nmap <S-f> :GrepperRg<Space>''<Left>
nmap <silent> <Leader>no :NERDTreeToggle <Bar> call <SID>RemapBuffers()<CR>
nmap <silent> <Leader>nf :NERDTreeFind <Bar> call <SID>RemapBuffers()<CR>
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
nmap <C-p> :Files<CR>
cmap <C-p> <Up>
cmap <C-n> <Down>
inoremap <silent> <expr><Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
imap <silent><CR> <CR><Plug>AutoPairsReturn
" inoremap <silent> <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
" inoremap <silent> <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" nmap <F5> <Plug>(JavaComplete-Imports-Add)
" imap <F5> <Plug>(JavaComplete-Imports-Add)
" nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
" imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

command! FormatCF %s/\\n/\r/g | %s/\\t/\t/g | setf json
command! FormatJSON setf json | %!python -m json.tool
command! JavaTags !ctags -R --java-kinds=+acefgilmp .

autocmd FileType javascript nested nmap <buffer> <silent> <C-]> :TernDef<CR>
autocmd FileType rust nmap <buffer> <silent> <C-]> <Plug>(rust-def)
autocmd FileType javascript nested setlocal tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead Vagrantfile nested set filetype=ruby
autocmd BufNewFile,BufRead .tern-project nested set filetype=json
autocmd BufNewFile,BufRead *.mxml nested set filetype=mxml
autocmd FileType go nested setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
autocmd FileType json nested setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType java nested setlocal omnifunc=javacomplete#Complete tags+=$HOME/.vim/tags/java/jdk
autocmd FileType c nested setlocal tags+=$HOME/.tags/c/headers,$HOME/.vim/tags/c/sdl
autocmd FileType cpp nested setlocal tags+=$HOME/.tags/c++/headers,$HOME/.vim/tags/c/sdl
" autocmd Bufread,BufNewFile *.cfm set filetype=eoz
" autocmd Bufread,BufNewFile *.cfc set filetype=eoz

" prevent Startify from using absolute paths
autocmd! BufEnter * lcd `pwd` | syntax sync fromstart | call <SID>RemapBuffers()
" autocmd BufEnter * if &ft ==# 'tagbar' | setlocal wrap | endif
autocmd BufLeave * nested if &ft ==# 'tagbar' | call s:FixAirlineFromTagbar() | endif
" autocmd! BufWritePost * Neomake
autocmd VimEnter * nested call s:AllowCodi()
