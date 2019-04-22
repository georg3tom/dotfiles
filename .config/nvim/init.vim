filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'SirVer/ultisnips'
Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'
Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/badwolf'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'neomake/neomake'
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on

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
set title
set undofile
" set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             COLORSCHEME                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme palenight
" colorscheme badwolf
if g:colors_name == "badwolf"
	set termguicolors
	autocmd VimEnter * highlight Normal ctermbg=16 guibg=#1C1C1C
	autocmd VimEnter * highlight LineNr ctermbg=16 guibg=#242424
	autocmd VimEnter * highlight SignColumn ctermbg=16 guibg=#262626
	" autocmd VimEnter * highlight Pmenu ctermbg=16 guibg=#121212
	" autocmd VimEnter * highlight CursorLine ctermbg=16 guibg=#121212
endif

if g:colors_name == "palenight"
	set termguicolors
	autocmd VimEnter * highlight Normal ctermbg=16 guibg=#1C1C1C
	autocmd VimEnter * highlight LineNr ctermbg=16 guibg=#242424
	" autocmd VimEnter * highlight SignColumn ctermbg=16 guibg=#262626
	" autocmd VimEnter * highlight Pmenu ctermbg=16 guibg=#121212
	" autocmd VimEnter * highlight CursorLine ctermbg=16 guibg=#121212
endif
let g:palenight_terminal_italics=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Plugin settings                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <silent> <C-n> :NERDTreeToggle<CR>	"ctrl+n shorcut for NERDtree
set timeoutlen=1000 ttimeoutlen=0
let g:airline_powerline_fonts = 1
let g:airline_theme='badcat'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
" let g:ycm_key_list_select_completion = ['<Down>']

let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
set runtimepath+=~/.vim/bundle/ultisnips/custom/
let g:UltiSnipsSnippetsDir='~/.vim/bundle/ultisnips/custom/'
let g:UltiSnipsSnippetDirectories=["custom", "UltiSnips"]
let g:ycm_min_num_of_chars_for_completion = 1
" let g:airline#extensions#tabline#enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             FZF config                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-p> :Files<cr>
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
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
autocmd BufReadPost silent! * %s/\s\+$//e

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
"                           Neomake config                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call neomake#configure#automake('w')

" Show message when all tests are passing
function! MyOnNeomakeJobFinished() abort
	let context = g:neomake_hook_context
	if context.jobinfo.exit_code == 0
		echom printf('😃 All tests passed ')
	endif
	if context.jobinfo.exit_code == 1
		echom printf('🤬 Failing tests')
	endif
endfunction

augroup my_neomake_hooks
	au!
	autocmd User NeomakeJobFinished call MyOnNeomakeJobFinished()
augroup END

let g:neomake_warning_sign ={'text': '●'}
let g:neomake_error_sign = {'text': '●'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Save folds                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead * normal zR
" augroup AutoSaveFolds
" 	autocmd!
" 	autocmd BufWinLeave * silent! mkview
" 	autocmd BufWinEnter * silent! loadview
" augroup END

