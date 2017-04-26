
execute pathogen#infect()

map <Help> <Esc>
map! <Help> <Esc>
se go+=M
"
"Format line facilities :
"  ()   split the current line at 70 chars 
"  ()   concat next line at the current one then split it at 70 chars
"  (t)    format line from the current cursor position to the next dot. 
"  (.)  back one indentation at line end
map  Q 70|lF a
imap    70|lF a
"
"VI parametrisation :
"
filetype plugin on
se report=1
se nosm
"se noshowcmd
se showcmd
"se noshowmode
"se noshowmatch
se ai
se sw=4
se ts=4
se textwidth=0
se notimeout
se nobk
se nowb
se nohls
se expandtab "I like blanks instead of tabs...
"map! <Del> <BS>
se backspace=2
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

map! <F1> 
map  <F1> 
se nocompatible
au BufNewFile,BufRead *.c,*.cc,*.cpp            se cindent
au BufNewFile,BufRead *.tex,*.sty,*.txt         se autoindent
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.tex      se expandtab
syntax on
se visualbell
map q :cn
"map ; .
"map ² 
"map <Insert> <PageDown>
"map <Del> <PageUp>
se wildignore=*.o,*.obj,*.bak,*.out,*~,*.log,*.aux,*.a
se laststatus=0
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif 
se mouse=a

"set colorcolumn=80

noremap j gj
noremap k gk
noremap $ g$

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

colorscheme desert_thl
"colorscheme bandit
"colorscheme twilighted
set background=dark

"se noruler
se ruler
set laststatus=2
" spiiph's
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file

se showmode
"se noshowmode
"        highlight MatchParen ctermbg=4
"let loaded_matchparen = 1 "Totally avoid showing matching parenthesis
se modelines=15

augroup filetypedetect
au BufNewFile,BufRead *.tex setlocal spell spelllang=en
augroup END

"Toggle option 'spell'
function! ToggleSpell()
 if &spell
  set nospell
 else
  set spell
 end
endfunction

" spell checking
function! ToggleSpellLang()
    " toggle between en and fr
    if &spelllang =~# 'pt'
        :set spelllang=fr
    elseif &spelllang =~# 'fr'
        :set spelllang=en
    else 
        :set spelllang=pt
    endif
endfunction

noremap <F11> :call ToggleSpell()<cr>
inoremap <F11> <Esc>:call ToggleSpell()<cr>a
nnoremap <F12> :call ToggleSpellLang()<CR> " toggle language

nmap <F2> :cw<CR>
nmap <F3> :TagbarToggle<CR>

map <F4> :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>
map <F5> :exe "Ccontinue"<CR>
map <F6> :exe "Cnext "<CR>
map <F7> :exe "Cstep "<CR>
map <F8> :exe "Cprint " . expand("<cword>") <CR>

nmap <F9> :make ctags<CR> :cscope reset<CR> :make!<CR> :UpdateTypesFile<CR> 
nmap <F10> :make ctags<CR> :cscope reset<CR> :make!<CR> :UpdateTypesFile<CR> 

:set shortmess=a

" Clang Complete Settings
let g:clang_use_library=1
let g:clang_library_path='/usr/lib/llvm-3.8/lib/'
" if there's an error, allow us to see it
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Limit memory use
let g:clang_memory_percent=70
" Remove -std=c++11 if you don't use C++ for everything like I do.
"let g:clang_user_options=' -std=c++11 || exit 0'
let g:clang_user_options=' || exit 0'
" Set this to 0 if you don't want autoselect, 1 if you want autohighlight,
" and 2 if you want autoselect. 0 will make you arrow down to select the first
" option, 1 will select the first option for you, but won't insert it unless you
" press enter. 2 will automatically insert what it thinks is right. 1 is the most
" convenient IMO, and it defaults to 0.
let g:clang_auto_select=1

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'
" SuperTab completion fall-back 
set completeopt=menu,menuone
set pumheight=20
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

let g:tex_conceal = ""

let g:EasyColourCustomColours=1
let g:languagetool_jar='~/Apps/LanguageTool-3.0/languagetool-commandline.jar'

"highlight Pmenu ctermbg=darkgray ctermfg=white guifg=gray guibg=white
hi Pmenu    ctermfg=white ctermbg=darkgray
hi PmenuSel ctermfg=black ctermbg=gray
hi PmenuSbar ctermbg=Gray
hi PmenuThumb ctermbg=White
hi ColorColumn ctermbg=darkgray

set ignorecase
set smartcase

"set linebreak
let g:atp_Compiler = 'bash'
let b:atp_TexCompiler  = "pdflatex" 
let g:atp_ProgressBar = 1
let g:atp_DefaultDebugMode = "Debug"
let g:atp_status_notification = 1

let g:color_coded_enabled=0
let g:color_coded_filetypes = ['c', 'cpp', 'objc', 'h']


let NERDTreeQuitOnOpen=0
au VimEnter *  NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autoclose=0

" Pyclewn
let g:pyclewn_args = "--pgm=arm-none-eabi-gdb --window=usetab --gdb=async"
" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:syntastic_c_checkers = ['cppcheck', 'gcc', 'clang_check', 'clang_tidy']
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1

" clang-format
map <C-K> :pyf /usr/share/clang/clang-format-3.8/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format-3.8/clang-format.py<cr>

"highlight Comment ctermbg=DarkGray
"highlight Constant ctermbg=Blue
"highlight Normal ctermbg=Black
"highlight NonText ctermbg=Black
"highlight Special ctermbg=DarkMagenta
"highlight Cursor ctermbg=Green
"hi Define 
"hi Normal
"hi Variable
"hi Namespace
"hi EnumConstant

"hi link StructDecl Type
"hi link UnionDecl Type
"hi link EnumDecl Type
"hi link PreProc Define
"syntax enable



