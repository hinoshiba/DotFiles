if has('vim_starting')
	set nocompatible
	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "install neobundle..."
		:call system("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundleCheck
NeoBundle 'vimwiki'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'vim-scripts/VOoM'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/vim-metarw-redmine'
NeoBundle 'kana/vim-metarw'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-fugitive'
call neobundle#end()

filetype plugin indent on
" set t_Co=256
syntax on

set backupskip=/tmp/*,/private/tmp/*
set number
set cursorline
noremap <C-a> ^
noremap <C-e> $
noremap <Space> :<C-u>VimwikiToggleListItem<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:indent_guides_enable_on_vim_startup = 1

function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
	augroup ZenkakuSpace
	autocmd!
	autocmd ColorScheme * call ZenkakuSpace()
	autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
	augroup END
	call ZenkakuSpace()
endif
if &term !~ "xterm-color"
	autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "^[k[`basename %`]^[??"' | endif
	autocmd VimLeave * silent! exe '!echo -n "^[k`dirs`^[??"'
endif

