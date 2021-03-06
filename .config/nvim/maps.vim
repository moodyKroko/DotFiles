" Description: Keymaps & commands

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

" QoL remaps
    nnoremap Y y$

" keeping it cetered
    nnoremap n nzzzv
    nnoremap N Nzzzv
    nnoremap J mzJ`z

" Undo break points
    inoremap , ,<c-g>u
    inoremap . .<c-g>u
    inoremap ! !<c-g>u
    inoremap ? ?<c-g>u

" Moving text
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv
    inoremap <C-j> <esc>:m .+1<CR>==
    inoremap <C-k> <esc>:m .-2<CR>==
    nnoremap <leader>k :m .-2<CR>==
    nnoremap <leader>j :m .+1<CR>==

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

" Python config
    let g:loaded_python_provider = 0
    let g:python3_host_prog = '/usr/bin/python3'

" Launch fzf with CTRL+P.
    nnoremap <silent> <C-p> :FZF -m<CR>

" rainbow color bracket setting
    let g:rainbow_active = 1

" for Vim Startify
    let g:startify_session_dir = '~/.vim/session'


" Basic autocommands "{{{
" -----------------------------------------------------------------------------

" Auto-resize splits when Vim gets resized.
    autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
    au FocusGained,BufEnter * :checktime

" java auto insert main class
    autocmd BufNewFile *.java
      \ exe "normal Opublic class " .
      \ expand('%:t:r') .
      \ " {\n\n}\<Esc>1G"

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

" Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

" get correct comment highlighting
    autocmd FileType json syntax match Comment +\/\/.\+$+

"}}}

" TAB: Open current directory
    "nmap te :tabedit
    "nmap <S-Tab> :tabprev<Return>
    "nmap <Tab> :tabnext<Return>

" Coc settings "{{{
" -----------------------------------------------------------------------------
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

    nmap <silent><leader>la <Plug>(coc-codeaction)

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

" Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

" Rename symbol
    nmap <leader><S-r> <Plug>(coc-rename)

" Show all errors/warnings
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" Kitchen sink of all LSP commands
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

" Fuzzy search for ALL symbols
    nnoremap <silent><nowait> <space><S-s>  :<C-u>CocList -I symbols<cr>
"}}}

