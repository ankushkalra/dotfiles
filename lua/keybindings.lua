vim.g.mapleader = ';'

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true

vim.cmd([[
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

set tabstop=2
set shiftwidth=2
set expandtab

" window movement
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" chapter 10 - Training your fingers - Learn vimscript the hard way
inoremap jk <esc>
inoremap <esc> <nop>

" Nerd tree toggle
nnoremap <leader>n :NERDTreeToggle<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
	echom "Hello"
]])
