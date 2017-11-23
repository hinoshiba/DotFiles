if has('vim_starting')
  set nocompatible
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'nanotech/jellybeans.vim'

NeoBundleCheck
call neobundle#end()
filetype plugin indent on
" set t_Co=256
syntax on
if &term !~ "xterm-color"
	autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "^[k[`basename %`]^[??"' | endif
	autocmd VimLeave * silent! exe '!echo -n "^[k`dirs`^[??"'
endif


NeoBundle 'vimwiki'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'vim-scripts/VOoM'
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'mattn/vim-metarw-redmine'
NeoBundle 'kana/vim-metarw'
set backupskip=/tmp/*,/private/tmp/*
set number


noremap <C-a> ^
noremap <C-e> $
noremap <Space> :<C-u>VimwikiToggleListItem<CR>


