" John's vimrc
" To make a useful configuration
" Initial Date 2012-07-13


" General Settings


""""""""""""""""""""""""""""
"使用pathogen插件来管理插件
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


filetype indent plugin on "允许文件类型专属的缩进和插件,放在pathogen插件后
""""""""""""""""""""""""""""




set nocompatible "不与旧式的Vi模式兼容
set autoread     "文件在外部改变时自动重新载入
set nu           "显示行号
set mouse=a      "鼠标可用
set nobackup     "不产生*～的备份文件
set tabstop=4             "tab空格数
set softtabstop=4  
set hlsearch              "搜索高亮

colorscheme desert        "颜色方案
syntax on                 "语法高亮


" Encodings

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8



" PLUGINS

