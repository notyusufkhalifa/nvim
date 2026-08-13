local set = vim.opt

set.backupdir = vim.fn.stdpath("state") .. "/backup"

set.nu = true
set.relativenumber = true

set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2

set.smartindent = true

set.wrap = true

set.ignorecase = true
set.smartcase = true

set.termguicolors = true
set.background = 'dark'
set.signcolumn = 'yes'

set.cursorline = true

set.colorcolumn = '100'
set.textwidth = 100

set.clipboard:append('unnamedplus')

set.backspace = 'indent,eol,start'

set.splitbelow = true
set.splitright = true

set.iskeyword:append('-')

set.scrolloff = 8

set.swapfile = false
set.backup = false
set.undodir = os.getenv('HOME') .. '/.vim/undodir'
set.undofile = true

set.incsearch = true

set.updatetime = 50

set.guicursor = ""

set.isfname:append('@-@')
