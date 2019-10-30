call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Writing and exiting                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev qq q!
cnoreabbrev Qq q!
cnoreabbrev Qa qa

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set cursorline
set foldmethod=indent
set nrformats+=alpha
set splitright
set splitbelow
set mouse=a
set expandtab
set undofile
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             COLORSCHEME                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:palenight_terminal_italics=1
colorscheme palenight
if g:colors_name == "palenight"
    set termguicolors
    autocmd VimEnter * highlight Normal ctermbg=16 guibg=#1C1C1C
    autocmd VimEnter * highlight LineNr ctermbg=16 guibg=#242424
    autocmd VimEnter * highlight Pmenu ctermbg=16 guibg=#2e2e2e
    " autocmd VimEnter * highlight SignColumn ctermbg=16 guibg=#262626
    " autocmd VimEnter * highlight CursorLine ctermbg=16 guibg=#121212
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Plugin settings                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:neomake_python_pep8_exe = 'python3'
let g:neomake_python_enabled_makers = ['pep8']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Lightline                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if get(info, 'error', 0)
        return "\uf467"
    endif
    if get(info, 'warning', 0)
        return info['warning'] . "\uf421"
    endif
    return ""
endfunction

let g:lightline = {
            \   'colorscheme': 'material',
            \   'active': {
            \     'left':[ [ 'mode', 'paste' ],
            \              [ 'gitbranch' , 'readonly', 'filename', 'modified' ]
            \     ],
            \   'right': [ [ 'lineinfo' ], [ 'percent' ], ['status_diagnostic'] , [ 'fileformat',  'filetype' ] ]
            \   },
            \   'component_function': {
            \     'gitbranch': 'fugitive#head',
            \   }
            \ }
let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.tabline = {
            \   'left': [ ['tabs'] ],
            \   'right': [ ['close'] ]
            \ }
let g:lightline.component = {
            \ 'status_diagnostic': '%{StatusDiagnostic()}',
            \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              coc                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             FZF config                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
nmap <C-p> :Files<cr>
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>O :BTags<CR>
nnoremap <silent> <leader>o :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-i': 'split',
            \ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }

let g:rg_command = '
            \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
            \ -g "*.{ts,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
            \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

function! s:fzf_statusline()
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Got to last cursor position                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Remove trailing spaces                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! WhiteSpaceFix()
    let linenr=line(".")
    let colnr=col(".")
    %s/\s\+$//e
    cal cursor(linenr,colnr)
endfunction
nnoremap <silent> <leader>ww :call WhiteSpaceFix()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Clear search highlights                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       To sue ALT+{h,j,k,l} to navigate windows from any mode:       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"To use ALT+{h,j,k,l} to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     <Esc> to exit terminal mode                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Alt+<num> to change tab                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Save folds                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead * normal zR
" augroup AutoSaveFolds
" 	autocmd!
" 	autocmd BufWinLeave * silent! mkview
" 	autocmd BufWinEnter * silent! loadview
" augroup END
"
