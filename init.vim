call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'petertriho/nvim-scrollbar'

call plug#end()

let mapleader = ';'

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
" window movement
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" chapter 10 - Training your fingers - Learn vimscript the hard way
inoremap jk <esc>
inoremap <esc> <nop>

lua << EOF
require("scrollbar").setup({
	show = true
})
EOF

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
