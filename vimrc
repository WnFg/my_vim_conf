set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加


"fzf配置
set rtp+=~/.fzf
let g:fzf_action = {
      \ 'space': 'tab split',
      \ 'ctrl-z': 'split',
      \ 'ctrl-a': 'vsplit' }

function! TabPos_ActivateBuffer(num)
    let s:count = a:num
    exe "tabfirst"
    exe "tabnext" s:count
endfunction
 
function! TabPos_Initialize()
for i in range(1, 9)
        exe "map <D-" . i . "> :call TabPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <D-0> :call TabPos_ActivateBuffer(10)<CR>"
endfunction
 
"autocmd VimEnter * call TabPos_Initialize()
nmap ,, gt
nmap .. gT
"""""""""""""""""""""""""""""""""""""""""



" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
  Plugin 'iCyMind/NeoSolarized'
  Plugin 'godlygeek/tabular'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'iamcco/mathjax-support-for-mkdp'
  Plugin 'iamcco/markdown-preview.vim'


" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后
"
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'  "设置全局配置文件的路径
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
let g:ycm_confirm_extra_conf=0  " 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_key_invoke_completion = '<C-a>' " ctrl + a 触发补全
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

  " If you enable airline layer and have installed the powerline fonts, set it here.
  let g:airline_powerline_fonts=1
  let g:auto_open_preview = 1
"  set background=dark
"  set termguicolors
"colorscheme desert.vim
set wrap
set mouse=v
set backspace=indent,eol,start
set nu
syntax on
set tabstop=4
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{3}'],
			\ 'cs,lua,javascript': ['re!\w{3}'],
			\ }
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

"set previewheight=10
"let g:ycm_add_preview_to_completeopt = 1
"set autoindent
"set cindent 
"
"
" tagbar配置
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
set tags=~/brpc/src/tags
