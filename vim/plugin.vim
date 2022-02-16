" add plugins into packpath.
let s:vim_runtime=expand('<sfile>:p:h').'/..'
exe 'set runtimepath+=' .s:vim_runtime
exe 'set pp+=' .expand(s:vim_runtime.'/plugins')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" option:
" - dracula
" - gruvbox
" - molokai
" - OceanicNext
let s:theme='molokai'
exe 'packadd!' s:theme
exe 'colorscheme' s:theme


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
" close nerdtree after open a file.
let NERDTreeQuitOnOpen=3


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> taboo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:taboo_tab_format=" %N %f%m "


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>w :Windows<CR>
nnoremap <silent> <C-l> :Buffers<CR>
if executable("ag")
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
endif
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab drop',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --margin=1,4"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> vim-codefmt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>f :FormatCode<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" GoTo code navigation.
" key gd: go to definition
" key gy: go to type definition
" key gi: to to implementation
" key gr: go to references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" key \rn: rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> a.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>a :A<CR>
nnoremap <silent> <leader>va :AV<CR>
nnoremap <silent> <leader>sa :AS<CR>
let g:alternateExtensions_hh = "cc"
let g:alternateExtensions_cc = "h,hh"
let g:alternateExtensions_cpp = "h,hpp,hh"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-u>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> markdown-preview.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mkdp_open_to_the_world = 1
let g:mkdp_echo_preview_url = 1
let g:mkdp_refresh_slow = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Leader>f{char} to move to {char}
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader><Leader>s <Plug>(easymotion-overwin-f2)

" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---> gutentags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg']
let g:gutentags_modules = []
if executable('gtags') && executable('gtags-cscope')
  let g:gutentags_modules += ['gtags_cscope']
endif
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_auto_add_gtags_cscope = 1

function! s:get_gtags_file() abort
	if !exists('b:gutentags_files')
		return ''
	endif
	if !has_key(b:gutentags_files, 'gtags_cscope')
		return ''
	endif
	let tags = b:gutentags_files['gtags_cscope']
	if filereadable(tags)
		return tags
	endif
	return ''
endfunc

function! Cscope(type, query, ...)
  let reffile = s:get_gtags_file()
  let path    = get(a:, 2, ".")
  if a:type == "a"
    let arg = "-9"
  elseif a:type == "c"
    let arg = "-3"
  elseif a:type == "d"
    let arg = "-2"
  elseif a:type == "e"
    let arg = "-6"
  elseif a:type == "f"
    let arg = "-7"
  elseif a:type == "g"
    let arg = "-1"
  elseif a:type == "i"
    let arg = "-8"
  elseif a:type == "s"
    let arg = "-0"
  elseif a:type == "t"
    let arg = "-4"
  else
    echom "invalid type; use types from :cs command"
    return
  end

  let cmd = "gtags-cscope -dL -f " . reffile . " " . arg . " '" . a:query . "'"
  if path != "."
    let cmd = cmd . " | sed 's%^%" . path . "/%'"
  end

  " convert "<file> <func> <line number> <line" into a colorized
  "    "<file>:<line number>:<func>  <line>"
  let cmd = cmd . ' | awk ''{print $1":"$3":1"}'''
  " echo cmd
  call fzf#vim#grep(cmd, 2, fzf#vim#with_preview(), 0)
endfunction

command! -bang -nargs=* CscopeFindAssignments   call Cscope("a", <q-args>)
command! -bang -nargs=* CscopeFindCallers       call Cscope("c", <q-args>)
command! -bang -nargs=* CscopeFindCalled        call Cscope("d", <q-args>)
command! -bang -nargs=* CscopeFindEgrep         call Cscope("e", <q-args>)
command! -bang -nargs=* CscopeFindFile          call Cscope("f", <q-args>)
command! -bang -nargs=* CscopeFindGlobal        call Cscope("g", <q-args>)
command! -bang -nargs=* CscopeFindInclude       call Cscope("i", <q-args>)
command! -bang -nargs=* CscopeFindSymbol        call Cscope("s", <q-args>)
command! -bang -nargs=* CscopeFindTextString    call Cscope("t", <q-args>)

" handful of frequently used mappings
nnoremap <silent> <Leader>cg :call Cscope("g", "<C-R><C-W>")<CR>
nnoremap <silent> <Leader>cc :call Cscope("c", "<C-R><C-W>")<CR>
nnoremap <silent> <Leader>cf :call Cscope("f", "<C-R><C-W>")<CR>
nnorem'{ x = 1;1 = ""; z = 3;3 = ""; printf "\033[34m%s\033[0m:\033[31m%s\033[0m\011\033[37m%s\033[0m\n", x,z,$0; }'ap <silent> <Leader>cs :call Cscope("s", "<C-R><C-W>")<CR>
nnoremap <silent> <Leader>ct :call Cscope("t", "<C-R><C-W>")<CR>

nnoremap <Leader>cG :CscopeFindGlobal<SPACE>
nnoremap <Leader>cC :CscopeFindCallers<SPACE>
nnoremap <Leader>cF :CscopeFindFile<SPACE>
nnoremap <Leader>cT :CscopeFindTextString<SPACE>
nnoremap <Leader>cS :CscopeFindSymbol<SPACE>
