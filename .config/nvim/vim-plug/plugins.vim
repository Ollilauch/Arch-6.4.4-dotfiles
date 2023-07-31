call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'terrortylor/nvim-comment'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'windwp/nvim-autopairs'
Plug 'lervag/vimtex'
Plug 'nvim-orgmode/orgmode'
Plug 'michaelb/sniprun', {'do': 'sh install.sh'}
Plug 'nvim-neorg/neorg' | Plug 'nvim-lua/plenary.nvim'
Plug 'SirVer/ultisnips'
call plug#end()
