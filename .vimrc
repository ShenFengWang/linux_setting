filetype off
set nocompatible "关闭vi的一致性模式
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

"Bundle加载插件
Bundle 'gmarik/vundle'
Bundle 'AutoClose'
"Bundle 'The-NERD-tree'
"Bundle 'Solarized'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'matchit.zip'
Bundle 'gregsexton/MatchTag'
Bundle 'tomasr/molokai'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'stanangeloff/php.vim'
"Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()


filetype plugin indent on
set t_Co=256 "显示256色
set background=dark "背景色
colorscheme molokai "配色主题
set number         "显示行号
set ruler          "设置在编辑过程中右下角显示光标的行列信息
"set nowarp         "当一行文字很长时取消换行
set showcmd        "在状态栏显示正在输入的命令
set history=1000   "设置历史记录条数
"set nobackup       "取消备份
"set noswapfile     "禁止临时文件生成
set cursorline     "突出显示当前行
"set cursorcolumn   "突出显示当前列
set showmatch      "高亮显示匹配的括号
set autoindent     "继承前一行的缩进方式
"set cindent        "使用C样式的缩进

"开启语法高亮功能
syntax enable
syntax on

set ignorecase smartcase "搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set mouse=a        "设置在vim中可以使用鼠标，防止在linux终端下无法拷贝
set tabstop=4      "Tab宽度
set shiftwidth=4   "自动对齐空格数
set softtabstop=4  "按退格键时可以一次删除的空格数
set expandtab      "将Tab键转换成空格 需要Tab键时使用[Ctrl + V + Tab]
set encoding=utf-8 "设置编码方式

"自动判断编码时依次尝试以下编码
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,latin1

set autoread       "当文件被改动时自动载入
set confirm        "在处理未保存或只读文件时弹出确认
set clipboard+=unnamed "与windows共享剪贴板
set scrolloff=3    "光标移动到窗口顶部和底部时保持3行距离
"set novisualbell   "关闭使用可视响铃代替呼叫
"set noerrorbells   "关闭错误信息响铃
set magic          "设置魔术
"set hidden         "允许在有未保存的修改时切换缓冲区
set hlsearch       "高亮搜索
set incsearch      "边输入边查找

"NERDTree settings
autocmd vimenter * NERDTree "打开Vim自动打开NERDTree
"autocmd BufWinEnter * NERDTree "打开tab页仍然显示NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "当Vim只剩下NERDTree窗口时关闭Vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "当Vim只剩下NERDTree窗口时关闭Vim
autocmd vimenter * wincmd w "打开Vim光标在右侧编辑区
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

"call NERDTreeHighlightFile('py', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')

"NERDTree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"airline settings
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='term'

"surround settings
autocmd FileType php let b:surround_45 = "<?php \r ?>"

"Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

"YouCompleteMe settings
"let g:EclimCompletionMethod='omnifunc'

"Molokai settings
let g:molokai_original = 1

"<C-D> <C-U>
nmap <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
nmap <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>

"插入模式下方向映射
"imap l <right>
"imap h <left>
"imap j <down>
"imap k <up>
imap <C-K> <up>
imap <C-L> <right>
imap <C-H> <left>
imap <C-J> <down>

"复制粘贴
nmap <F2> "0p
nmap <S-F2> "0P
nmap <F3> "*p
nmap <S-F3> "*P
nmap <C-F3> "*yy
vmap <C-F3> "*y
vmap <F2> "0p
vmap <S-F2> "0P
vmap <F3> "*p
vmap <S-F3> "*P
vmap <F4> "+p
vmap <S-F4> "+P

"取消高亮
nmap c :nohlsearch<CR>

"change split
nmap n <C-W><C-W>
nmap b <C-W>h
"move split
nmap N <C-W>x

"ESC
"imap z; <ESC>

"设置leader
"let mapleader=' '

"标签页逆向切换
"nmap <leader>gt :tabp<CR>

"标签页操作
nmap <C-H> gT
nmap <C-L> gt

"NERDTree开关
nmap <F9> :NERDTreeToggle<CR>

"stanangeloff/php.vim setting
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
  hi! def link phpParent   phpComment
endfunction
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

"PHP
autocmd FileType php nmap <F5> o/**<ESC>o<CR>/<up><ESC>A<space>

"python
autocmd FileType python setlocal keywordprg=pydoc3
autocmd FileType python nmap <leader>r :!python3 %<CR>
autocmd FileType python set cursorcolumn
autocmd FileType python hi CursorColumn ctermbg=234
autocmd FileType python set fdm=indent

