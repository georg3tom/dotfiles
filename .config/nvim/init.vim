call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'tmsvg/pear-tree'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

" norms
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
set foldmethod=syntax
set nrformats+=alpha
set splitright
set splitbelow
set mouse=a
set undofile
set noshowmode
set nofoldenable
set colorcolumn=88
set listchars=tab:┆·,trail:· 
set list
set expandtab
set hidden
set completeopt=menuone,noinsert,longest
" set cursorline

colorscheme
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

" lightline

let g:lightline = {
            \   'colorscheme': 'material',
            \   'active': {
            \     'left':[ [ 'mode', 'paste' ],
            \              [ 'gitbranch' ],
            \              ['readonly', 'filename', 'modified' ]
            \     ],
            \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ]
            \   },
            \   'component_function': {
            \     'gitbranch': 'fugitive#head',
            \   }
            \ }
let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '', 'right': ''
            \}

" fzf
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
nmap <C-p> :Files<cr>
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> <leader>\ :Buffers<CR>
nnoremap <silent> <leader>B :Windows<CR>
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
" let g:fzf_layout = { 'down': '~20%' }
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,
            \'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }


let g:rg_command = '
            \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
            \ -g "*.{ts,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
            \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" function! s:fzf_statusline()
"     highlight fzf1 ctermfg=161 ctermbg=251
"     highlight fzf2 ctermfg=23 ctermbg=251
"     highlight fzf3 ctermfg=237 ctermbg=251
"     setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction
" autocmd! User FzfStatusLine call <SID>fzf_statusline()


" Go to last cursor position
au BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" remove trailing spaces
function! WhiteSpaceFix()
    let linenr=line(".")
    let colnr=col(".")
    %s/\s\+$//e
    cal cursor(linenr,colnr)
endfunction
nnoremap <silent> <leader>ww :call WhiteSpaceFix()<CR>

" esc clears search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>


"To use ALT+{h,j,k,l} to navigate windows from any mode:
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Commentary
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s


" highlight yank
augroup vimrc
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END


" .. and use <C-a> to select all
noremap <C-a> gg0vG$
vnoremap <C-a> <Esc>gg0vG$
inoremap <C-a> <Esc>gg0vG$

lua require('lua-config')

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'file']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

let g:completion_trigger_on_delete = 1
let g:completion_confirm_key = ""

imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
