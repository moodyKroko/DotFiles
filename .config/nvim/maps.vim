" Description: Keymaps

"bring up neovim setting
    nnoremap <Leader>v :tabedit $MYVIMRC<cr>

" Alternate way to save
    nnoremap <C-s> :w<CR>

" Alternate way to quit
    nnoremap <C-Q> <S-Z>Q

" Source Vim config file.
    map <Leader>sv :so %<CR>

" Shortcutting split navigation, saving a keypress:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Cycle through splits.
    nnoremap <S-Tab> <C-w>w

" NERDTree
    "noremap <Leader>n :NERDTreeToggle<Enter>
    nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" Prevent selecting and pasting from overwriting what you originally copied.
    xnoremap p pgvy

" resize
    nnoremap <silent> <Leader>vr :vertical resize 30<CR>
    nnoremap <silent> <Leader>+ :vertical resize +5<CR>
    nnoremap <silent> <Leader>- :vertical resize -5<CR>

    " Automatically delets all trailing whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e

" git
    nmap <leader>gs :G<CR>
    nmap <leader>gh :diffget //3<CR>
    nmap <leader>gu :diffget //2<CR>

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" tab completion
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
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigations
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
    "xmap <leader>f  <Plug>(coc-format-selected)
    "nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Launch fzf with CTRL+P.
    nnoremap <silent> <C-p> :FZF -m<CR>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" for Vim Startify
let g:startify_session_dir = '~/.vim/session'
