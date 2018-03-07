" base setting
" ====================================================
" 当编辑的文件在vim外被修改过自动读入
set autoread

" 设置文件编码格式
set encoding=utf-8

" Smart indent
set smartindent

" Auto indent
set autoindent

" 显示行号
set number

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

set cindent

" 设置折叠方式
set fdm=indent

" 文件类型检测并缩进
"   如果php模板的类型检测成php，然后并没有加载html缩进的插件，
"   需要手动设置文件类型为html或xml     :set filetype=html
filetype indent on


" 插件设置
" ====================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mattn/emmet-vim'		"html代码补全

Plugin 'kien/ctrlp.vim'			"搜索文件

Plugin 'scrooloose/nerdtree'	"侧边栏文件管理器

Plugin 'scrooloose/nerdcommenter'	"注释代码

Plugin 'tpope/vim-fugitive'			"Git插件

Plugin 'Valloric/YouCompleteMe'		"自动补全插件


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"	emmet settings
"------------------------
let g:user_emmet_leader_key = '<F2>' 	"设置emmet快捷键为F2


"	nerdtrr settings
"------------------------
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" 设置自动补全括号、引号 start
" ====================================================
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap } <c-r>=CloseBracket()<CR>
"inoremap " <c-r>=QuoteDelim('"')<CR>
"inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

function CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
		return "\<CR>}"
	else
		return "\<Esc>j0f}a"
	endif
endf

function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		return a:char
	elseif line[col - 1] == a:char
		return "\<Right>"
	else
		return a:char.a:char."\<Esc>i"
	endif
endf


"设置sidebar开启关闭快捷键
" ====================================================
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>


"设置前后tab快捷键
" ====================================================
map <F7> gT
map <F8> gt


"设置复制粘贴快捷键
" ====================================================
map <C-c> "+y
imap <C-v> <Esc>"+gpa


"solarized主题设置
" ====================================================
syntax enable
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized


"设置调整spit窗口快捷键
" ====================================================
nmap    w=  :resize +12<CR>
nmap    w-  :resize -12<CR>
nmap    w,  :vertical resize -48<CR>
nmap    w.  :vertical resize +48<CR>


" 自动保存退出时的会话
" ====================================================
" set sessionoptions=buffers,curdir,resize,folds,tabpages  
" 注意目录要存在  
" autocmd VimLeave * mks! /home/igo/vimfiles/session/Session.vim

