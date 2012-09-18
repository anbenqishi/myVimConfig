" John's vimrc
" To make a useful configuration
" Initial Date 2012-07-13

"OS Windows settings
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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

"set encoding=utf-8 "windows
set termencoding=utf-8
set fileencoding=utf-8



" PLUGINS

