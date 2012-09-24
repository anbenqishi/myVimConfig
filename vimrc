" John's vimrc
" To make a useful configuration
" Initial Date 2012-07-13

"OS Windows settings
if has('win32') || has('win64')
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
endif

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"End OS Windows setting



" General Settings

""""""""""""""""""""""""""""
"使用pathogen插件来管理插件
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
"call pathogen#helptags()


filetype plugin indent on "允许文件类型专属的缩进和插件,放在pathogen插件后
""""""""""""""""""""""""""""




set nocompatible "不与旧式的Vi模式兼容
set autoread     "文件在外部改变时自动重新载入
set nu           "显示行号
set mouse=a      "鼠标可用
set nobackup     "不产生*～的备份文件
set tabstop=4             "tab空格数
"软制表符宽度，设置为非零数值后使用 Tab 键和 Backspace 时光标移动的格数等于该数值，
"但实际插入的字符仍受 tabstop 和 expandtab 控制
set softtabstop=4  
set hlsearch              "搜索高亮
set shiftwidth=4          "缩进的空格数
set cindent               "使用C语言的缩进
set ambiwidth=double      "把所有的"不明宽度"字符的宽度置为双倍字符宽度（中文字符宽度）
set guifont=Courier_New:h12 "使用gui时的显示字体和大小

colorscheme desert        "颜色方案
syntax on                 "语法高亮


" Encodings

"set encoding=utf-8 "Vim内部使用的encoding,windows下菜单会乱码
if has('win32') || has('win64')
	set fileencoding=chinese
else
	set fileencoding=utf-8 "Vim当前编辑文件的encoding
endif
"set termencoding=utf-8
"Vim启动时会按列出的encoding顺序依次探测
set fileencodings=utf-8,gbk,ucs-bom,cp936,latin1,euc-jp,euc-kr



" PLUGINS

" inherent---- new-omni-completion
set completeopt=longest,menu
set wildmenu
set omnifunc=syntaxcomplete#Complete
"Via ctrl-space, instead of the original
"inoremap <Nul> <C-x><C-o>  
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet

" Configure the Tag List plugin
"nnoremap :TlistToggle
let Tlist_Show_One_File=1 "Only show the tag list of current file
let Tlist_Exit_OnlyWindow=1 "If you are the last,kill yourself
"let Tlist_Use_Right_Window=1 "Show on the right
let Tlist_WinWidth=30        "Set the window 40 cols wide

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1 " Use neocomplcache
let g:neocomplcache_enable_smat_case = 1  " Use smartcase

" NerdTree {
       " map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
       " map <leader>e :NERDTreeFind<CR>
       " nmap <leader>nt :NERDTreeFind<CR>
		map wtt :NERDTreeToggle<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        "let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
" }

" MiniBufExplorer {
	"let g:miniBufExplMapWindowNavVim = 1 
	"let g:miniBufExplMapWindowNavArrows = 1 
	"let g:miniBufExplMapCTabSwitchBufs = 1 
	"let g:miniBufExplModSelTarget = 1
" }
" 
" Winmanager {
	let g:NERDTree_title = 'NERD Tree'
	let g:winManagerWindowLayout = 'NERDTree|TagList'
	nmap wm :WMToggle<CR>
function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction
	
" }

